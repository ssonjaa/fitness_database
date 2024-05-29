INSERT INTO ipdb_v2.user (username, password_hash, type, name, lastname, email, city, avatar, activated, archived) VALUES
("a", "a", "K", "Test", "Korisnik", "Grad", "1.png", "sonbon181@gmail.com", 0, 0),
("t", "t", "I", "Test", "Instruktor", "Grad", "1.png", "sonbon181@gmail.com", 0, 0),
("sonja", "123", "K", "Sonja", "Bojanic", "Banja Luka", "2.png", "sonbon181@gmail.com", 0, 0),
("chuck100", "123", "I", "Chuck", "Norris", "Prijedor", "8.png", "sonbon181@gmail.com", 0, 0);
INSERT INTO ipdb_v2.activation (activation_sequence, user_id) VALUES
("067e6162-3b6f-4ae2-a171-2470b63dff00", 1),
("067e6162-3b6f-4ae2-a171-2470b63dff00", 2),
("067e6162-3b6f-4ae2-a171-2470b63dff00", 3),
("067e6162-3b6f-4ae2-a171-2470b63dff00", 4);
INSERT INTO ipdb_v2.progress (user_id) VALUES (1), (2), (3), (4);
INSERT INTO ipdb_v2.category (name) VALUES ("Cardio"), ("Strength"), ("Flexibility"), ("HIIT");
INSERT INTO ipdb_v2.attribute (name, category_id, unit) VALUES ("Type of activity", 1,null), ("Duration", 1,"min"), ("Equipment", 2, null), ("Bodyweight", 2, "kg"), ("Type of activity", 3, null), ("Duration", 3, "min"), ("Type of activity", 4, null), ("Duration", 4,"min");
INSERT INTO ipdb_v2.program (title, description, price, level, duration_in_days, location, gallery_directory, created_by_id, instructor_id, category_id, archived) VALUES 
("Power Hour Cardio: A Full Body Cardio Workout", " A plan that will help you reap all the benefits of cardio, but with the intensity and excitement of throwing around weights.", 200, 5, 90, "online", null, 1, 2, 1,0), 
("Double Your Flexibility in the Next 4 Weeks!", "For anyone who is willing to set aside 15 minutes a day for flexibility training and add specific micronutrients to their diet to support their tissues. Proper flexibility training and proper nutrition are where you’ll find the biggest results.", 120, 3, 60, "online", null, 1, 2, 3,0),
("Muscle & Strength’s 12 Week Women’s Workout Program", " This 12 week women's specific training program is perfect for any healthy woman who is looking to transform her body through a good weight lifting program.", 250, 3, 120, "online", null, 1, 2, 2,0), 
("Body Like A God: A Complete Bodyweight Muscle Building Plan", "No equipment or gym? No problem. Build muscle at home with this classic bodyweight training system. This is a flexible training system that focuses on the use of exercise complexes.", 200, 4, 30, "online", null, 1, 2, 2,0),
("Title1", "Description", 100, 1, 100, "location", "http://localhost:8080/api/v2/files/a/5/8fa36937be8743cf9c29397562fb7dce.jpg", 1, 1, 1,0),
("Title2", "Description", 200, 1, 30, "location", "http://localhost:8080/api/v2/files/t/6/ec3f3b73f703fe96368bb12649f3524f.jpg", 2, 1, 1,0),
("Title3", "Description", 250, 1, 90, "online", "http://localhost:8080/api/v2/files/a/7/9134e77af2444f4d936159cfdcac0e12.jpg", 1, 1, 1,0),
("Title4", "Description", 100, 1, 60, "location", "http://localhost:8080/api/v2/files/t/8/9a8a6e59552e3c8adf0a1eeadac5efd0.jpg", 2, 1, 1,0),
("Title5", "Description", 150, 1, 14, "online", "http://localhost:8080/api/v2/files/t/9/83015788d8436fc2a1f6fc409351f83e.jpg", 2, 1, 1,0),
("Title6", "Description", 90, 1, 30, "location", "http://localhost:8080/api/v2/files/a/10/3ae31daa6a24c4077202281c8245e492.jpg", 1, 1, 1,0),
("Title6", "Description", 90, 1, 30, "location", "http://localhost:8080/api/v2/files/sonja/11/testSlika3.jpg", 3, 1, 1,0);
INSERT INTO ipdb_v2.message (timestamp, text, from_id, to_id, seen) VALUES 
('2024-01-5 14:32:28', "Ovo je testna poruka.", 1, 2, 0),
('2024-02-02 09:15:07', "Ovo je testna poruka.", 2, 1, 0),
('2024-03-14 12:10:33', "Ovo je testna poruka.", 1, 3, 0),
('2024-05-08 17:47:16', "Ovo je testna poruka.", 4, 2, 0),
('2024-04-04 09:09:09', "Ovo je testna poruka.", 4, 1, 0);
INSERT INTO ipdb_v2.comment (timestamp, text, program_id, user_id) VALUES 
('2024-04-04 09:09:09', "Ovo je testni komentar.", 1, 1), 
('2024-04-04 09:09:09', "Ovo je testni komentar.", 1, 2), 
('2024-04-04 09:09:09', "Ovo je testni komentar.", 1, 3), 
('2024-04-04 09:09:09', "Ovo je testni komentar.", 3, 1), 
('2024-04-04 09:09:09', "Ovo je testni komentar.", 3, 2), 
('2024-04-04 09:09:09', "Ovo je testni komentar.", 3, 3);
INSERT INTO ipdb_v2.admin (username, password_hash, name, lastname) VALUES
("a", "a", "Admin", "Admin"),
("admin1", "123", "Sonja", "Bojanic");
INSERT INTO  ipdb_v2.tag (value, attribute_id, program_id) VALUES 
("Running",1,1), ("30",2,1), ("Weights",3,2), ("70",4,2),
("Yoga",5,3), ("1",6,3), ("hiit",7,4), ("45",8,4);
INSERT INTO ipdb_v2.fitness_backend_log (timestamp, user_id, controller, log) VALUES 
('2024-04-04 09:09:09', null, "UserEntityController", "Test log entry."),
('2024-04-04 09:09:09', null, "ProgramEntityController", "Test log entry.");
INSERT INTO ipdb_v2.question (timestamp, title, text, from_id, seen, answered) VALUES 
('2024-04-04 09:09:09', "Title of the question", "Ovo je jedno testno pitanje?", 1, 0, 0),
('2024-04-04 09:09:09', "Title", "Ovo je jedno testno pitanje?", 1, 0, 0),
('2024-04-04 09:09:09', "Title", "Ovo je jedno testno pitanje?", 2, 0, 0),
('2024-04-04 09:09:09', "Title", "Ovo je jedno testno pitanje?", 3, 0, 0);
INSERT INTO ipdb_v2.adviser (username, password_hash, name, lastname, email) VALUES
("savjet001", "123456","Prvi", "Savjetnik", "agnesnutter87@gmail.com"),
("askme00", "123456","Drugi", "Savjetnik",  "agnesnutter87@gmail.com");
INSERT INTO ipdb_v2.participation (timestamp, payment_type, card_number, program_id, user_id, active) VALUES
('2024-04-04 09:09:09', "card", "1234 5678 9000", 1, 1, 1),
('2024-04-04 09:09:09', "cash", null, 2, 1, 1),
('2024-04-04 09:09:09', "card", "1234 5678 9000", 3, 3, 1);
INSERT INTO ipdb_v2.entry (timestamp, title, text, progress_id) VALUES
('2024-04-04 09:09:09', null, "trčanje 45min", 1), ('2024-04-12 09:09:09', "Naslov unosa", "Neki unos u dnevnik aktivnosti", 1),
('2024-04-13 09:09:09', "Rest day", "Nema aktivnosti", 1), ('2024-04-20 09:09:09', null, "30min trčanje", 1);
INSERT INTO ipdb_v2.weight (timestamp, weight_in_kg, progress_id) VALUES 
('2024-03-04 09:09:09', 60.000, 1),('2024-03-14 09:09:09', 59.450, 1), ('2024-04-04 09:09:09', 61.700, 1),
('2024-04-12 09:09:09', 59.900, 1);
