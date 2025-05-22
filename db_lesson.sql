--Q1
CREATE TABLE `departments` (
`department_id` INT unsigned NOT NULL auto_increment PRIMARY KEY,
`name` VARCHAR(20) NOT NULL,
`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--Q2
ALTER TABLE people ADD department_id INT unsigned NULL AFTER email

--Q3
INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム')
;

INSERT INTO people (name,email,department_id,age,gender)
VALUES
('織田信長','oda@gizumo.jp',1,20,1),
('徳川家康','tokugawa@gizumo.jp',1,36,1),
('聖徳太子','sixyou@gizumo.jp',1,35,1),
('紫式部','murasaki@gizumo.jp',2,37,2),
('夏目漱石','natume@gizumo.jp',2,36,1),
('坂本龍馬','sakamoto@gizumo.jp',2,47,1),
('安倍晋三','abe@gizumo.jp',2,35,1),
('大谷翔平','ootani@gizumo.jp',3,14,1),
('黒澤明','kurosawa@gizumo.jp',4,64,1),
('美空ひばり','misora@gizumo.jp',5,35,2)
;

INSERT INTO reports (person_id,content)
VALUES
(1,'ああああああああああ'),
(1,'いいいいいいいいいい'),
(1,'うううううううううう'),
(1,'ええええええええええ'),
(1,'おおおおおおおおおお'),
(1,'かかかかかかかかかか'),
(1,'きききききききききき'),
(1,'くくくくくくくくくく'),
(1,'けけけけけけけけけけ'),
(1,'ここここここここここ')
;

--Q4
UPDATE people SET department_id = 1 WHERE person_id = 1;
UPDATE people SET department_id = 1 WHERE person_id = 2;
UPDATE people SET department_id = 1 WHERE person_id = 3;
UPDATE people SET department_id = 1 WHERE person_id = 4;
UPDATE people SET department_id = 1 WHERE person_id = 6;

--Q5
SELECT name,age FROM people WHERE gender = 1 ORDER BY age DESC;

--Q6
SELECT
`name`, `email`, `age`
・データベースから`name`, `email`, `age`のデータを引き出すSQL文。
FROM
  `people`
・操作対象のテーブル`people`を指定する。
WHERE
  `department_id` = 1
・`department_id`が1のもの。といったふうに、データベースから取得するデータを絞り込める。
ORDER BY
  `created_at`;
・データを並び替えるために使用.
・created_at は 昇順に並び替える。

--Q7
SELECT name FROM people WHERE (age BETWEEN 20 and 29 and gender = 2)
or (age BETWEEN 40 and 49 and gender = 1);

--Q8
SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;

--Q9
SELECT AVG(age) AS average_age FROM people WHERE gender = 2;

--Q10
SELECT p.name, r.person_id, r.content FROM reports r JOIN people p ON r.person_id = p.person_id;

--Q11
SELECT p.name FROM people p LEFT JOIN reports r ON p.person_id = r.person_id WHERE r.content IS NULL;
