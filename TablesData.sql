INSERT INTO GroupMember (GroupID, MemberName) 
VALUES
(1, 'john_doe'),
(1, 'jane_smith'),
(2, 'jane_smith');


INSERT INTO GroupAdmin (GroupID, AdminName) 
VALUES
(1, 'john_doe'),
(2, 'jane_smith');

INSERT INTO UserProjects (ProjectID, UserName) 
VALUES
(1, 'john_doe'),
(2, 'jane_smith'),
(1, 'jane_smith');

INSERT INTO Investing (ProjectID, InvestorName, PayMethod, Amount, InvestmentDate, InvestmentTime, ContractURL) 
VALUES
(1, 'jane_smith', 'Credit Card', 5000.00, '2024-12-21', '10:30:00', 'http://example.com/contract1.pdf'),
(2, 'john_doe', 'Bank Transfer', 3000.00, '2024-12-20', '14:00:00', 'http://example.com/contract2.pdf');

INSERT INTO Attend (EventID, AttendentName) 
VALUES
(1, 'john_doe'),
(1, 'jane_smith'),
(2, 'jane_smith');

INSERT INTO Organize (EventID, OrganizerName) 
VALUES
(1, 'john_doe'),
(2, 'jane_smith');

INSERT INTO React (UserName, PostID, Type, Time, Date) 
VALUES
('john_doe', 1, 'Like', '10:15:00', '2024-12-21'),
('jane_smith', 2, 'Love', '16:45:00', '2024-12-20');

INSERT INTO GroupPost (GroupID) 
VALUES
(1),
(2);

INSERT INTO [user] (UserName, FirstName, LastName, Email, Password, BIO, PicURL, CreationDate, CreationTime, LastActiveDate, LastActiveTime)
VALUES
('ahmed_hassan', 'Ahmed', 'Hassan', 'ahmed.hassan@example.com', 'password123', 'Software Engineer', NULL, '2024-12-20', '10:00:00', '2024-12-21', '12:00:00'),
('mohamed_ali', 'Mohamed', 'Ali', 'mohamed.ali@example.com', 'password123', 'Backend Developer', NULL, '2024-12-20', '10:00:00', '2024-12-21', '12:00:00'),
('sara_khaled', 'Sara', 'Khaled', 'sara.khaled@example.com', 'password123', 'Project Manager', NULL, '2024-12-20', '10:00:00', '2024-12-21', '12:00:00'),
('fatma_omar', 'Fatma', 'Omar', 'fatma.omar@example.com', 'password123', 'Designer', NULL, '2024-12-20', '10:00:00', '2024-12-21', '12:00:00');


INSERT INTO [Group] (Name, Type, Description)
VALUES
('Tech Enthusiasts', 'Technology', 'A group for tech lovers to share ideas.'),
('Project Managers', 'Management', 'A group for project managers to discuss strategies.'),
('Designers Hub', 'Design', 'A group for designers to showcase their work.');

INSERT INTO Project (Title, Description, CreationDate, CreationTime, UpdateName, UpdateTime, MediaURL)
VALUES
('AI Chatbot', 'A chatbot project using machine learning.', '2024-12-20', '11:00:00', NULL, NULL, NULL),
('E-commerce Platform', 'A platform for online shopping.', '2024-12-20', '11:30:00', NULL, NULL, NULL),
('Mobile Game', 'A fun and interactive mobile game.', '2024-12-20', '12:00:00', NULL, NULL, NULL);

INSERT INTO Category (Name, Description)
VALUES
('Technology', 'Projects related to technology.'),
('Design', 'Projects related to design.'),
('Games', 'Projects related to gaming.');

INSERT INTO Event (Title, AnnounceDate, AnnounceTime, Description, EventDate, EventTime)
VALUES
('Tech Conference', '2024-12-18', '10:00:00', 'Annual tech conference.', '2024-12-25', '09:00:00'),
('Design Workshop', '2024-12-19', '11:00:00', 'Interactive workshop for designers.', '2024-12-26', '10:00:00'),
('Game Jam', '2024-12-20', '12:00:00', '48-hour game development contest.', '2024-12-27', '11:00:00');

INSERT INTO Follow (FollowerName, FollowedName, Date, Time)
VALUES
('ahmed_hassan', 'mohamed_ali', '2024-12-20', '13:00:00'),
('sara_khaled', 'fatma_omar', '2024-12-21', '14:00:00');

INSERT INTO Post (Content, PostDate, PostTime, MediaURL, PosterName)
VALUES
('Check out this new tech tool!', '2024-12-20', '15:00:00', NULL, 'ahmed_hassan'),
('New project updates coming soon.', '2024-12-21', '16:00:00', NULL, 'mohamed_ali');

INSERT INTO Comment (PostID, CommenterName, Time, Date, Content)
VALUES
(1, 'sara_khaled', '17:00:00', '2024-12-20', 'Looks interesting!'),
(2, 'fatma_omar', '18:00:00', '2024-12-21', 'Great work!');

INSERT INTO Message (Content, SendDate, SendTime, SenderName, ReceiverName)
VALUES
('Hi Mohamed, check this out!', '2024-12-20', '19:00:00', 'ahmed_hassan', 'mohamed_ali'),
('Thanks for sharing, Ahmed!', '2024-12-21', '20:00:00', 'mohamed_ali', 'ahmed_hassan');

INSERT INTO ProjectCategory (ProjectID, CategoryID)
VALUES

(2, 2)

INSERT INTO GroupMember (GroupID, MemberName)
VALUES
(1, 'ahmed_hassan'),
(2, 'sara_khaled'),
(3, 'fatma_omar');

INSERT INTO GroupAdmin (GroupID, AdminName)
VALUES
(1, 'ahmed_hassan'),
(2, 'sara_khaled');

INSERT INTO Investing (ProjectID, InvestorName, PayMethod, Amount, InvestmentDate, InvestmentTime, ContractURL)
VALUES
(1, 'ahmed_hassan', 'Credit Card', 15000.00, '2024-12-20', '13:00:00', 'http://contracts.com/contract1.pdf');

INSERT INTO Attend (EventID, AttendentName)
VALUES
(1, 'ahmed_hassan'),
(2, 'mohamed_ali');

INSERT INTO Organize (EventID, OrganizerName)
VALUES
(1, 'ahmed_hassan'),
(2, 'sara_khaled');

INSERT INTO React (UserName, PostID, Type, Time, Date)
VALUES
('ahmed_hassan', 1, 'Like', '10:00:00', '2024-12-20');

INSERT INTO GroupPost (GroupID)
VALUES
(1),
(2);

INSERT INTO UserProjects (ProjectID, UserName)
VALUES
(1, 'ahmed_hassan'), 
(2, 'mohamed_ali'), 
(3, 'sara_khaled'),  
(1, 'sara_khaled'),  
(2, 'ahmed_hassan'); 
