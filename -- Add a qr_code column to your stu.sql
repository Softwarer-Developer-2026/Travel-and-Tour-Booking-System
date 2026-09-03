-- Add a qr_code column to your students table if it doesn't exist already
ALTER TABLE `students` ADD COLUMN `qr_code` VARCHAR(255) UNIQUE AFTER `student_id`;