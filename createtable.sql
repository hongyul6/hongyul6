use moviedb;
CREATE TABLE `moviedb`.`movies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL DEFAULT '',
  `year` INT NOT NULL,
  `director` VARCHAR(100) NOT NULL DEFAULT '',
  `banner_url` VARCHAR(200) NULL DEFAULT '',
  `trailer_url` VARCHAR(200) NULL DEFAULT '',
  PRIMARY KEY (`id`));movies
  
  CREATE TABLE `moviedb`.`stars` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL DEFAULT '',
  `last_name` VARCHAR(50) NOT NULL DEFAULT '',
  `dob` DATE NULL,
  `photo_url` VARCHAR(200) NULL DEFAULT '',
  PRIMARY KEY (`id`));

CREATE TABLE `moviedb`.`stars_in_movies` (
  `star_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  INDEX `id_idx` (`movie_id` ASC),
  CONSTRAINT `star_id`
    FOREIGN KEY (`star_id`)
    REFERENCES `moviedb`.`stars` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `moviedb`.`movies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
    CREATE TABLE `moviedb`.`genres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`));

CREATE TABLE `moviedb`.`genres_in_movies` (
  `genre_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  INDEX `genre_id_idx` (`genre_id` ASC),
  INDEX `movie_id_idx` (`movie_id` ASC),
  CONSTRAINT `genre_id`
    FOREIGN KEY (`genre_id`)
    REFERENCES `moviedb`.`genres` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `genre_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `moviedb`.`movies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
    CREATE TABLE `moviedb`.`customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL DEFAULT '',
  `last_name` VARCHAR(50) NOT NULL DEFAULT '',
  `cc_id` VARCHAR(20) NOT NULL DEFAULT '',
  `address` VARCHAR(200) NOT NULL DEFAULT '',
  `email` VARCHAR(50) NOT NULL DEFAULT '',
  `password` VARCHAR(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  INDEX `cc_id_idx` (`cc_id` ASC),
  CONSTRAINT `cc_id`
    FOREIGN KEY (`cc_id`)
    REFERENCES `moviedb`.`creditcards` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `moviedb`.`sales` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  `sale_date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `customer_id_idx` (`customer_id` ASC),
  INDEX `movie_id_idx` (`movie_id` ASC),
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `moviedb`.`customers` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `sales_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `moviedb`.`movies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


    CREATE TABLE `moviedb`.`creditcards` (
  `id` VARCHAR(20) NOT NULL DEFAULT '',
  `first_name` VARCHAR(50) NOT NULL DEFAULT '',
  `last_name` VARCHAR(50) NOT NULL DEFAULT '',
  `expiration` DATE NOT NULL,
  PRIMARY KEY (`id`));

