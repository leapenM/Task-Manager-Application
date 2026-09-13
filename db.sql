CREATE TABLE sources (
    "id" INTEGER PRIMARY KEY,
    "type" TEXT NOT NULL,
    "label" TEXT
);

-- SPECIFIC TASK DETAILS
CREATE TABLE github_details (
    "source_id" INTEGER PRIMARY KEY,
    "project" TEXT NOT NULL,
    FOREIGN KEY ("source_id") REFERENCES sources("id")
);

CREATE TABLE email_details (
    "source_id" INTEGER PRIMARY KEY,
    "email_account" TEXT NOT NULL,
    FOREIGN KEY ("source_id") REFERENCES sources("id")
);

CREATE TABLE event_details (
    "source_id" INTEGER PRIMARY KEY,
    "required" BOOLEAN DEFAULT TRUE,
    FOREIGN KEY ("source_id") REFERENCES sources("id")
);

CREATE TABLE coursework_details (
    "source_id" INTEGER PRIMARY KEY,
    "class_category" TEXT NOT NULL,
    FOREIGN KEY ("source_id") REFERENCES sources("id")
);

--

CREATE TABLE tasks (
    "id" INTEGER PRIMARY KEY,
    "source_id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT,
    "due_date" DATETIME,
    FOREIGN KEY ("source_id") REFERENCES sources("id")
);

CREATE TABLE completion_log (
    "id" INTEGER PRIMARY KEY,
    "task_id" INTEGER NOT NULL,
    "event_type" TEXT NOT NULL,
    "completion_date" DATETIME NOT NULL,
    FOREIGN KEY ("task_id") REFERENCES tasks("id")
);

CREATE TABLE estimates (
    "id" INTEGER PRIMARY KEY,
    "task_id" INTEGER NOT NULL,
    "predicted_minutes" INTEGER NOT NULL,
    "actual_minutes" INTEGER,
    FOREIGN KEY ("task_id") REFERENCES tasks("id")
);