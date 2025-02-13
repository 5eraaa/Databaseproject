
-- top reacted on post
select  top 1 count(R.PostID)as no_ofreacts , R.PostID
from React R , Post P
where R.PostID = P.PostID
group by R.PostID
order by  no_ofreacts desc


--refuse follow
--declare @FollowerName varchar(50) = 'sara_khaled';
--declare @FollowedName varchar(50) = 'fatma_omar';
--add follower
declare @FollowerName varchar(50) = 'ahmed_hassan';
declare @FollowedName varchar(50) = 'fatma_omar';

if  exists(select * 
from Follow
where FollowerName = @FollowerName and FollowedName = @FollowedName)
begin
    print 'Already Following';
end
else
begin
    insert into Follow (FollowerName, FollowedName, Date, Time)
    values (@FollowerName, @FollowedName, getdate(), getdate());
    print 'Followed';
end


-- post failed
begin transaction ;

insert into Post (Content, PostDate, PostTime, MediaURL, PosterName)
values ('congrats bla bla', getdate(), getdate(), null, 'fatma_omar');
--error valued 
--values ('congrats bla bla', getdate(), getdate(), null, 'fatma_said');
if @@error != 0
begin
    rollback transaction;
    print 'Failed to add post!';
end
else
begin
    commit transaction;
    print 'Post added successfully!';
end


--total follower
select f.FollowedName, count(*) no_of_followers
from Follow f 
group by f.FollowedName;


--total comm on a post 
create function  dbo.commcount(@PostID int)
returns int 
as 
begin
    declare @Count int;
    select @Count = count(*) from Comment where PostID = @PostID;
    return isnull(@Count, 0);
end;

select dbo.commcount(1) as TotalComments;

