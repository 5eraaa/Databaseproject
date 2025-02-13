/*Stored Procedure*/
/* RegisterUser*/
CREATE PROCEDURE RegisterUser
    @UserName VARCHAR(50),
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(50),
    @Password VARCHAR(50)
AS
BEGIN
    INSERT INTO [user](UserName, FirstName, LastName, Email, Password, CreationDate, CreationTime)
    VALUES (@UserName, @FirstName, @LastName, @Email, @Password, CAST(GETDATE() AS DATE), CAST(GETDATE() AS TIME));
END;


--EXEC RegisterUser 
--    @UserName = 'john_doeee',
--    @FirstName = 'John',
--    @LastName = 'Doe',
--    @Email = 'john.doeee@example.com',
--    @Password = 'password123';



/* GetAllUserPosts*/
CREATE PROCEDURE GetUserPosts
    @UserName VARCHAR(50)
AS
BEGIN
    SELECT PostID, Content, PostDate, PostTime, MediaURL
    FROM Post
    WHERE PosterName = @UserName;
END;
--EXEC GetUserPosts @UserName = 'mohamedelsawah';



--GetFollowers

CREATE PROCEDURE GetFollowers
    @UserName VARCHAR(50)
AS
BEGIN
    SELECT FollowerName, Date, Time
    FROM Follow
    WHERE FollowedName = @UserName;
END;


--EXEC GetFollowers @UserName = 'MOSTAFA KHAIRA';



/* Views*/


/* ProjectsWithCategories*/
CREATE VIEW ProjectsWithCategories AS
SELECT 
    p.ProjectID, 
    p.Title, 
    c.Name AS CategoryName
FROM Project p
JOIN ProjectCategory pc ON p.ProjectID = pc.ProjectID
JOIN Category c ON pc.CategoryID = c.CategoryID;

--select *from ProjectsWithCategories

--InvestmentsWithProjectInfo
CREATE VIEW InvestmentsWithProjectInfo AS
SELECT 
    i.ProjectID,
    p.Title AS ProjectTitle,
    i.InvestorName,
    i.Amount,
    i.InvestmentDate,
    i.InvestmentTime
FROM Investing i
JOIN Project p ON i.ProjectID = p.ProjectID;

--Select *from InvestmentsWithProjectInfo

/* Trigers*/


--CheckInvestmentLimit
CREATE TRIGGER CheckInvestmentLimit
ON Investing
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE Amount > 100000
    )
    BEGIN
        PRINT 'Warning: Investment amount exceeds the limit of $100,000!';
    END;
END;

INSERT INTO Investing (ProjectID, InvestorName, PayMethod, Amount, InvestmentDate, InvestmentTime, ContractURL)
VALUES (1, 'john_doe', 'Credit Card', 50000, CAST(GETDATE() AS DATE), CAST(GETDATE() AS TIME), NULL);

--INSERT INTO Investing (ProjectID, InvestorName, PayMethod, Amount, InvestmentDate, InvestmentTime, ContractURL)
--VALUES (2, 'mohamedelsawah', 'Bank Transfer', 150000, CAST(GETDATE() AS DATE), CAST(GETDATE() AS TIME), NULL);


/* PreventDuplicateEmails*/
CREATE TRIGGER PreventDuplicateEmails
ON [user]
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM [user] u JOIN inserted i ON u.Email = i.Email)
    BEGIN
        THROW 50000, 'Duplicate Email Not Allowed.', 1;
    END
    ELSE
    BEGIN
        INSERT INTO [user](UserName, FirstName, LastName, Email, Password, BIO, PicURL, CreationDate, CreationTime, LastActiveDate, LastActiveTime)
        SELECT UserName, FirstName, LastName, Email, Password, BIO, PicURL, CreationDate, CreationTime, LastActiveDate, LastActiveTime FROM inserted;
    END;
END;

--INSERT INTO [user] (UserName, FirstName, LastName, Email, Password, BIO, PicURL, CreationDate, CreationTime, LastActiveDate, LastActiveTime)
--VALUES 
--('ahmedmohamed', 'ahmed', 'mohamed', 'ahmedmohamed@example.com', 'password123', NULL, NULL, CAST(GETDATE() AS DATE), CAST(GETDATE() AS TIME), NULL, NULL);

--INSERT INTO [user] (UserName, FirstName, LastName, Email, Password, BIO, PicURL, CreationDate, CreationTime, LastActiveDate, LastActiveTime)
--VALUES 
--('ahmedmohameddd', 'ahmeddd', 'mohamed', 'ahmedmohamed@example.com', 'password456', NULL, NULL, CAST(GETDATE() AS DATE), CAST(GETDATE() AS TIME), NULL, NULL);



/*SomeQuerly*/
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


