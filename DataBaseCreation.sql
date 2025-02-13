
CREATE TABLE[user](
    UserName VARCHAR(50) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50)UNIQUE NOT NULL,
    Password VARCHAR(50)NOT NULL,
    BIO TEXT,
    PicURL VARCHAR(255),
    CreationDate DATE,
    CreationTime TIME,
    LastActiveDate DATE,
    LastActiveTime TIME
);

CREATE TABLE Follow (
    FollowerName VARCHAR(50),
    FollowedName VARCHAR(50),
    Date DATE,
    Time TIME,
    PRIMARY KEY (FollowerName, FollowedName),
    FOREIGN KEY (FollowerName) REFERENCES [user](UserName),
    FOREIGN KEY (FollowedName) REFERENCES [user](UserName)
);

CREATE TABLE [Group] (
    GroupID INT PRIMARY KEY IDENTITY (1,1),
    Name VARCHAR(50)NOT NULL,
    Type VARCHAR(50),
    Description TEXT
);

CREATE TABLE Post (
    PostID INT PRIMARY KEY  IDENTITY (1,1),
    Content TEXT,
    PostDate DATE,
    PostTime TIME,
    MediaURL VARCHAR(255),
    PosterName VARCHAR(50),
    FOREIGN KEY (PosterName) REFERENCES [user](UserName)
);

CREATE TABLE Comment (
    PostID INT,
    CommenterName VARCHAR(50),
    Time TIME,
    Date DATE,
    Content TEXT,
    PRIMARY KEY (PostID, CommenterName, Time, Date),
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (CommenterName) REFERENCES [user](UserName)
);

CREATE TABLE Message (
    MessageID INT PRIMARY KEY IDENTITY(1,1),
    Content TEXT,
    SendDate DATE,
    SendTime TIME,
    SenderName VARCHAR(50),
    ReceiverName VARCHAR(50),
	FOREIGN KEY (SenderName) REFERENCES [user](UserName),
	FOREIGN KEY (ReceiverName) REFERENCES [user](UserName)
 );

CREATE TABLE Project (
    ProjectID INT PRIMARY KEY IDENTITY (1,1),
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    CreationDate DATE,
    CreationTime TIME,
    UpdateName VARCHAR(100),
    UpdateTime TIME,
    MediaURL VARCHAR(255)
);

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY (1,1),
    Name VARCHAR(100) NOT NULL,
    Description TEXT
);

CREATE TABLE ProjectCategory (
    ProjectID INT,
    CategoryID INT,
    PRIMARY KEY (ProjectID, CategoryID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Event (
    EventID INT PRIMARY KEY IDENTITY (1,1),
    Title VARCHAR(100) NOT NULL,
    AnnounceDate DATE,
    AnnounceTime TIME,
    Description TEXT,
    EventDate DATE,
    EventTime TIME
);

CREATE TABLE OnsiteEvent (
    EventID INT PRIMARY KEY,
    Country VARCHAR(100),
    City VARCHAR(100),
    Street VARCHAR(255),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

CREATE TABLE OnlineEvent (
    EventID INT PRIMARY KEY,
    Platform VARCHAR(100),
    MeetingURL VARCHAR(255),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

CREATE TABLE GroupAdmin (
    GroupID INT,
    AdminName VARCHAR(50),
    PRIMARY KEY (GroupID, AdminName),
    FOREIGN KEY (GroupID) REFERENCES [Group](GroupID), 
    FOREIGN KEY (AdminName) REFERENCES [user](UserName)
);

CREATE TABLE GroupMember (
    GroupID INT,
    MemberName VARCHAR(50),
    PRIMARY KEY (GroupID, MemberName),
    FOREIGN KEY (GroupID) REFERENCES [Group](GroupID),
    FOREIGN KEY (MemberName) REFERENCES [user](UserName)
);

CREATE TABLE UserProjects (
    ProjectID INT,
    UserName VARCHAR(50),
    PRIMARY KEY (ProjectID, UserName),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    FOREIGN KEY (UserName) REFERENCES [user](UserName)
);

CREATE TABLE Investing (
    ProjectID INT,
    InvestorName VARCHAR(50),
    PayMethod VARCHAR(50),
    Amount DECIMAL(15,2),
    InvestmentDate DATE,
    InvestmentTime TIME,
    ContractURL VARCHAR(255),
    PRIMARY KEY (ProjectID, InvestorName),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    FOREIGN KEY (InvestorName) REFERENCES [user](UserName)
);

CREATE TABLE Attend (
    EventID INT,
    AttendentName VARCHAR(50),
    PRIMARY KEY (EventID, AttendentName),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (AttendentName) REFERENCES [user](UserName)
);

CREATE TABLE Organize (
    EventID INT,
    OrganizerName VARCHAR(50),
    PRIMARY KEY (EventID, OrganizerName),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (OrganizerName) REFERENCES [user](UserName)
);

CREATE TABLE React (
    UserName VARCHAR(50),
    PostID INT,
    Type VARCHAR(20),
    Time TIME,
    Date DATE,
    PRIMARY KEY (UserName, PostID),
    FOREIGN KEY (UserName) REFERENCES [user](UserName),
    FOREIGN KEY (PostID) REFERENCES Post(PostID)
);

CREATE TABLE GroupPost (
    PostID INT  IDENTITY(1,1),
    GroupID INT,
    PRIMARY KEY (PostID, GroupID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (GroupID) REFERENCES [Group] (GroupID) ,
);


