CREATE TABLE Bibliotecario (
    CPF VARCHAR(255) PRIMARY KEY,
    Nome VARCHAR(255)
);

CREATE TABLE Usuario (
    CPF VARCHAR(255) PRIMARY KEY,
    Nome VARCHAR(255),
    CEP VARCHAR(10),
    Num INT,
    Rua VARCHAR(255),
    Bairro VARCHAR(255),
    CPFBibliotecario VARCHAR(255),
    FOREIGN KEY (CPFBibliotecario) REFERENCES Bibliotecario(CPF)
);

CREATE TABLE Emprestimo (
    ID INT PRIMARY KEY,
    Atraso INT,
    DataEmprestimo DATE,
    DataDevolucao DATE,
    ISBN INT,
    CPFUsuario VARCHAR(255),
    CPFBibliotecario VARCHAR(255),
    FOREIGN KEY (CPFUsuario) REFERENCES Usuario(CPF),
    FOREIGN KEY (CPFBibliotecario) REFERENCES Bibliotecario(CPF)
);

CREATE TABLE Celular (
    ID INT PRIMARY KEY,
    Numero VARCHAR(20),
    CPFUsuario VARCHAR(255),
    CPFBibliotecario VARCHAR(255),
    FOREIGN KEY (CPFUsuario) REFERENCES Usuario(CPF),
    FOREIGN KEY (CPFBibliotecario) REFERENCES Bibliotecario(CPF)
);

CREATE TABLE Email (
    ID INT PRIMARY KEY,
    EnderecoEmail VARCHAR(255),
    CPFUsuario VARCHAR(255),
    CPFBibliotecario VARCHAR(255),
    FOREIGN KEY (CPFUsuario) REFERENCES Usuario(CPF),
    FOREIGN KEY (CPFBibliotecario) REFERENCES Bibliotecario(CPF)
);

CREATE TABLE Autor (
    autorID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Nacionalidade VARCHAR(255),
    CPFBibliotecario VARCHAR(255),
    FOREIGN KEY (CPFBibliotecario) REFERENCES Bibliotecario(CPF)
);


CREATE TABLE Livro (
    ISBN INT PRIMARY KEY,
    Ano INT,
    NumPaginas INT,
    Titulo VARCHAR(255),
    categoriaID INT,
    CPFBibliotecario VARCHAR(255),
    FOREIGN KEY (categoriaID) REFERENCES Categoria(categoriaID),
    FOREIGN KEY (CPFBibliotecario) REFERENCES Bibliotecario(CPF)
);


CREATE TABLE Categoria (
    categoriaID INT PRIMARY KEY,
    LivrosTotal INT,
    Nome VARCHAR(255),
    CPFBibliotecario VARCHAR(255),
    FOREIGN KEY (CPFBibliotecario) REFERENCES Bibliotecario(CPF)
);



CREATE TABLE LivroCategoria (
    ISBN INT,
    categoriaID INT,
    PRIMARY KEY (ISBN, categoriaID),
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN),
    FOREIGN KEY (categoriaID) REFERENCES Categoria(categoriaID)
);

CREATE TABLE LivroAutor (
    ISBN INT,
    autorID INT,
    PRIMARY KEY (ISBN, autorID),
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN),
    FOREIGN KEY (autorID) REFERENCES Autor(autorID)
);



-----------------------------------------------------------------



-- Inserção de dados na tabela Bibliotecario
INSERT INTO Bibliotecario (CPF, Nome)
VALUES
('43871342831', 'Luis Henrique'),
('98765432100', 'Maria Oliveira'),
('12345678999', 'Carlos Silva'),
('11122233344', 'Ana Pereira'),
('55566677788', 'Rafael Santos'),
('99988877766', 'Camila Souza'),
('77788899955', 'Rodrigo Lima'),
('33344455522', 'Isabela Costa'),
('66655544433', 'João Oliveira'),
('22233344411', 'Juliana Alves'),
('44433322200', 'Pedro Silva'),
('11100022233', 'Luciana Rocha'),
('55511177799', 'Fernanda Santos'),
('22266633344', 'Eduardo Lima'),
('88877766655', 'Tatiane Oliveira'),
('77711188800', 'Vinícius Pereira'),
('33355522299', 'Mariana Costa'),
('66611144422', 'Gustavo Souza'),
('99922277788', 'Bianca Alves'),
('44488800011', 'Lucas Rocha');


-- Inserção de dados na tabela Usuario
INSERT INTO Usuario (CPF, Nome, CEP, Num, Rua, Bairro, CPFBibliotecario)
VALUES
('11111111111', 'Joana Oliveira', '12345-678', 123, 'Rua A', 'Bairro 1', '43871342831'),
('22222222222', 'Carlos Souza', '54321-876', 456, 'Rua B', 'Bairro 2', '98765432100'),
('33333333333', 'Mariana Silva', '98765-432', 789, 'Rua C', 'Bairro 3', '12345678999'),
('44444444444', 'Lucas Pereira', '13579-246', 159, 'Rua D', 'Bairro 4', '11122233344'),
('55555555555', 'Beatriz Lima', '98712-345', 753, 'Rua E', 'Bairro 5', '55566677788'),
('66666666666', 'Ricardo Costa', '76543-210', 258, 'Rua F', 'Bairro 6', '99988877766'),
('77777777777', 'Amanda Alves', '10987-654', 852, 'Rua G', 'Bairro 7', '77788899955'),
('88888888888', 'Pedro Rocha', '54321-098', 741, 'Rua H', 'Bairro 8', '33344455522'),
('99999999999', 'Isabella Oliveira', '12345-678', 963, 'Rua I', 'Bairro 9', '66655544433'),
('10101010101', 'Rodrigo Santos', '98765-432', 147, 'Rua J', 'Bairro 10', '22233344411'),
('11112222333', 'Luana Lima', '13579-246', 369, 'Rua K', 'Bairro 11', '44433322200'),
('12121212121', 'Guilherme Silva', '98712-345', 951, 'Rua L', 'Bairro 12', '11100022233'),
('13131313131', 'Larissa Souza', '76543-210', 753, 'Rua M', 'Bairro 13', '55511177799'),
('14141414141', 'Fernando Pereira', '10987-654', 258, 'Rua N', 'Bairro 14', '22266633344'),
('15151515151', 'Vanessa Oliveira', '54321-098', 852, 'Rua O', 'Bairro 15', '88877766655'),
('16161616161', 'Henrique Pereira', '12345-678', 963, 'Rua P', 'Bairro 16', '77711188800'),
('17171717171', 'Julia Alves', '98765-432', 369, 'Rua Q', 'Bairro 17', '33355522299'),
('18181818181', 'Gabriel Costa', '13579-246', 147, 'Rua R', 'Bairro 18', '66611144422'),
('19191919191', 'Laura Lima', '98712-345', 951, 'Rua S', 'Bairro 19', '99922277788'),
('20202020202', 'Mateus Rocha', '76543-210', 753, 'Rua T', 'Bairro 20', '44488800011');


-- Inserção de dados na tabela Autor
INSERT INTO Autor (autorID, Nome, Nacionalidade, CPFBibliotecario)
VALUES
(1, 'Carlos Drummond de Andrade', 'Brasileira', '43871342831'),
(2, 'Machado de Assis', 'Brasileira', '98765432100'),
(3, 'Gabriel Garcia Márquez', 'Colombiana', '12345678999'),
(4, 'J.K. Rowling', 'Britânica', '11122233344'),
(5, 'George Orwell', 'Britânica', '55566677788'),
(6, 'Agatha Christie', 'Britânica', '99988877766'),
(7, 'Jane Austen', 'Britânica', '77788899955'),
(8, 'Fyodor Dostoevsky', 'Russa', '33344455522'),
(9, 'Leo Tolstoy', 'Russa', '66655544433'),
(10, 'William Shakespeare', 'Britânica', '22233344411'),
(11, 'Franz Kafka', 'Austríaca', '44433322200'),
(12, 'Clarice Lispector', 'Brasileira', '11100022233'),
(13, 'J.R.R. Tolkien', 'Britânica', '55511177799'),
(14, 'Ernest Hemingway', 'Americana', '22266633344'),
(15, 'Virginia Woolf', 'Britânica', '88877766655'),
(16, 'F. Scott Fitzgerald', 'Americana', '77711188800'),
(17, 'Fernando Pessoa', 'Portuguesa', '33355522299'),
(18, 'Albert Camus', 'Argelina', '66611144422'),
(19, 'Gabriel Garcia Márquez', 'Colombiana', '99922277788'),
(20, 'Arthur Conan Doyle', 'Britânica', '44488800011');






-- Criar novamente a tabela Livro com o tipo de dado correto para ISBN
CREATE TABLE Livro (
    ISBN BIGINT PRIMARY KEY,
    Ano INT,
    NumPaginas INT,
    Titulo VARCHAR(255),
    categoriaID INT,
    CPFBibliotecario VARCHAR(255),
    FOREIGN KEY (categoriaID) REFERENCES Categoria(categoriaID),
    FOREIGN KEY (CPFBibliotecario) REFERENCES Bibliotecario(CPF)
);


-- Criar a tabela LivroAutor
CREATE TABLE LivroAutor (
    ISBN BIGINT,
    autorID INT,
    PRIMARY KEY (ISBN, autorID),
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN),
    FOREIGN KEY (autorID) REFERENCES Autor(autorID)
);

-- Criar a tabela LivroCategoria
CREATE TABLE LivroCategoria (
    ISBN BIGINT,
    categoriaID INT,
    PRIMARY KEY (ISBN, categoriaID),
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN),
    FOREIGN KEY (categoriaID) REFERENCES Categoria(categoriaID)
);

-- Inserir dados na tabela Categoria
INSERT INTO Categoria (categoriaID, LivrosTotal, Nome, CPFBibliotecario)
VALUES
(1, 0, 'Fantasia', '43871342831'),
(2, 0, 'Ficção', '98765432100'),
(3, 0, 'Autoajuda', '12345678999'),
(4, 0, 'Clássico', '11122233344'),
(5, 0, 'Drama', '55566677788'),
(6, 0, 'Suspense', '99988877766'),
(7, 0, 'Romance', '77788899955'),
(8, 0, 'Existencialismo', '33344455522'),
(9, 0, 'Infantil', '66655544433'),
(10, 0, 'Realismo Mágico', '22233344411'),
(11, 0, 'Aventura', '44433322200'),
(12, 0, 'História', '11100022233'),
(13, 0, 'Biografia', '55511177799'),
(14, 0, 'Filosofia', '22266633344'),
(15, 0, 'Poesia', '88877766655'),
(16, 0, 'Terror', '77711188800'),
(17, 0, 'Ficção Científica', '33355522299'),
(18, 0, 'Ensaios', '66611144422'),
(19, 0, 'História em Quadrinhos', '99922277788'),
(20, 0, 'Mistério', '44488800011');




-- Inserir dados na tabela Livro
INSERT INTO Livro (ISBN, Ano, NumPaginas, Titulo, categoriaID, CPFBibliotecario)
VALUES
(9788535902779, 2005, 309, 'Harry Potter e o Enigma do Príncipe', 1, '43871342831'),
(9788535914925, 1999, 254, 'Harry Potter e o Cálice de Fogo', 1, '98765432100'),
(9788535912372, 2013, 243, 'A Menina que Roubava Livros', 2, '12345678999'),
(9788535916103, 2016, 264, 'O Homem Mais Inteligente da História', 3, '11122233344'),
(9788535909471, 1949, 328, '1984', 4, '55566677788'),
(9788525431495, 1939, 286, 'E Não Sobrou Nenhum', 2, '99988877766'),
(9788535918329, 1813, 279, 'Orgulho e Preconceito', 5, '77788899955'),
(9788560171359, 1866, 983, 'Crime e Castigo', 4, '33344455522'),
(9788535914734, 1869, 1225, 'Guerra e Paz', 4, '66655544433'),
(9788535915595, 1597, 246, 'Hamlet', 5, '22233344411'),
(9788535915816, 1925, 251, 'O Processo', 6, '44433322200'),
(9788535908061, 1974, 224, 'A Hora da Estrela', 2, '11100022233'),
(9788535908849, 1954, 398, 'O Senhor dos Anéis', 1, '55511177799'),
(9788535912440, 1952, 540, 'O Velho e o Mar', 7, '22266633344'),
(9788535912761, 1925, 316, 'Mrs. Dalloway', 5, '88877766655'),
(9788525409029, 1925, 288, 'O Grande Gatsby', 7, '77711188800'),
(9788535905084, 1938, 182, 'O Estrangeiro', 8, '33355522299'),
(9788535915519, 1942, 160, 'O Pequeno Príncipe', 9, '66611144422'),
(9788535913256, 1967, 368, 'Cem Anos de Solidão', 10, '99922277788'),
(9788525430993, 1887, 191, 'O Signo dos Quatro', 1, '44488800011');








SELECT * FROM Autor
SELECT * FROM Bibliotecario
SELECT * FROM Categoria
SELECT * FROM Celular  
SELECT * FROM Email    
SELECT * FROM Emprestimo 
SELECT * FROM Livro
SELECT * FROM LivroAutor FALTA
SELECT * FROM LivroCategoria FALTA
SELECT * FROM Usuario


-- Inserção de dados na tabela Celular
INSERT INTO Celular (ID, Numero, CPFUsuario, CPFBibliotecario)
VALUES
(1, '123456789', '11111111111', '43871342831'),
(2, '987654321', '22222222222', '98765432100'),
(3, '987123654', '33333333333', '12345678999'),
(4, '456789123', '44444444444', '11122233344'),
(5, '741852963', '55555555555', '55566677788'),
(6, '369258147', '66666666666', '99988877766'),
(7, '147258369', '77777777777', '77788899955'),
(8, '258369147', '88888888888', '33344455522'),
(9, '123789456', '99999999999', '66655544433'),
(10, '963852741', '10101010101', '22233344411'),
(11, '789456123', '11112222333', '44433322200'),
(12, '456123789', '12121212121', '11100022233'),
(13, '852963741', '13131313131', '55511177799'),
(14, '321654987', '14141414141', '22266633344'),
(15, '654987321', '15151515151', '88877766655'),
(16, '987321654', '16161616161', '77711188800'),
(17, '369741258', '17171717171', '33355522299'),
(18, '123987654', '18181818181', '66611144422'),
(19, '987456321', '19191919191', '99922277788'),
(20, '789123456', '20202020202', '44488800011');

-- Inserção de dados na tabela Email
INSERT INTO Email (ID, EnderecoEmail, CPFUsuario, CPFBibliotecario)
VALUES
(1, 'joana@gmail.com', '11111111111', '43871342831'),
(2, 'carlos@gmail.com', '22222222222', '98765432100'),
(3, 'mariana@gmail.com', '33333333333', '12345678999'),
(4, 'lucas@gmail.com', '44444444444', '11122233344'),
(5, 'beatriz@gmail.com', '55555555555', '55566677788'),
(6, 'ricardo@gmail.com', '66666666666', '99988877766'),
(7, 'amanda@gmail.com', '77777777777', '77788899955'),
(8, 'pedro@gmail.com', '88888888888', '33344455522'),
(9, 'isabella@gmail.com', '99999999999', '66655544433'),
(10, 'rodrigo@gmail.com', '10101010101', '22233344411'),
(11, 'luana@gmail.com', '11112222333', '44433322200'),
(12, 'guilherme@gmail.com', '12121212121', '11100022233'),
(13, 'larissa@gmail.com', '13131313131', '55511177799'),
(14, 'fernando@gmail.com', '14141414141', '22266633344'),
(15, 'vanessa@gmail.com', '15151515151', '88877766655'),
(16, 'henrique@gmail.com', '16161616161', '77711188800'),
(17, 'julia@gmail.com', '17171717171', '33355522299'),
(18, 'gabriel@gmail.com', '18181818181', '66611144422'),
(19, 'laura@gmail.com', '19191919191', '99922277788'),
(20, 'mateus@gmail.com', '20202020202', '44488800011');



-- Inserção de dados na tabela Emprestimo
INSERT INTO Emprestimo (ID, DataEmprestimo, DataDevolucao, ISBN, CPFUsuario, CPFBibliotecario)
VALUES
(1, '2023-01-01', '2023-01-15', '5902779', '11111111111', '43871342831'),
(2, '2023-02-01', '2023-02-15', '5914925', '22222222222', '98765432100'),
(3, '2023-03-01', '2023-03-15', '5912372', '33333333333', '12345678999'),
(4, '2023-04-01', '2023-04-15', '5916103', '44444444444', '11122233344'),
(5, '2023-05-01', '2023-05-15', '5909471', '55555555555', '55566677788'),
(6, '2023-06-01', '2023-06-15', '5431495', '66666666666', '99988877766'),
(7, '2023-07-01', '2023-07-15', '5918329', '77777777777', '77788899955'),
(8, '2023-08-01', '2023-08-15', '0171359', '88888888888', '33344455522'),
(9, '2023-09-01', '2023-09-15', '3914734', '99999999999', '66655544433'),
(10, '2023-10-01', '2023-10-15', '5315595', '10101010101', '22233344411'),
(11, '2023-11-01', '2023-11-15', '5915816', '11112222333', '44433322200'),
(12, '2023-12-01', '2023-12-15', '3508061', '12121212121', '11100022233'),
(13, '2024-01-01', '2024-01-15', '9759849', '13131313131', '55511177799'),
(14, '2024-02-01', '2024-02-15', '3591440', '14141414141', '22266633344'),
(15, '2024-03-01', '2024-03-15', '5912761', '15151515151', '88877766655'),
(16, '2024-04-01', '2024-04-15', '5409029', '16161616161', '77711188800'),
(17, '2024-05-01', '2024-05-15', '9905084', '17171717171', '33355522299'),
(18, '2024-06-01', '2024-06-15', '9915519', '18181818181', '66611144422'),
(19, '2024-07-01', '2024-07-15', '9713256', '19191919191', '99922277788'),
(20, '2024-08-01', '2024-08-15', '5430993', '20202020202', '44488800011');



-- Inserção de dados na tabela LivroAutor
INSERT INTO LivroAutor (AutorID, ISBN)
VALUES
(1, '9788535902779'),
(2, '9788535902779'),
(3, '9788535914925'),
(4, '9788535916103'),
(5, '9788535909471'),
(6, '9788525431495'),
(7, '9788535918329'),
(8, '9788560171359'),
(9, '9788535914734'),
(10, '9788535915595'),
(11, '9788535915816'),
(12, '9788535908061'),
(13, '9788535908849'),
(14, '9788535912440'),
(15, '9788535912761'),
(16, '9788525409029'),
(17, '9788535905084'),
(18, '9788535915519'),
(19, '9788535913256'),
(20, '9788525430993');

-- Inserção de dados na tabela LivroCategoria
INSERT INTO LivroCategoria (ISBN, CategoriaID)
VALUES
('9788535902779', 1),
('9788535914925', 1),
('9788535912372', 2),
('9788535916103', 3),
('9788535909471', 4),
('9788525431495', 2),
('9788535918329', 5),
('9788560171359', 4),
('9788535914734', 4),
('9788535915595', 5),
('9788535915816', 6),
('9788535908061', 2),
('9788535908849', 1),
('9788535912440', 7),
('9788535912761', 5),
('9788525409029', 7),
('9788535905084', 8),
('9788535915519', 9),
('9788535913256', 10),
('9788525430993', 1);


------------------------------------------------------------------------------------------

---CRUD
-- Inserção de um novo Livro
INSERT INTO Livro (ISBN, Ano, NumPaginas, Titulo, categoriaID, CPFBibliotecario)
VALUES (9788535901111, 2022, 300, 'Novo Livro', 1, '43871342831');

-- Seleção de todos os Livros
SELECT * FROM Livro;

-- Atualização do título do Livro
UPDATE Livro
SET Titulo = 'Livro Atualizado'
WHERE ISBN = 9788535901111;

-- Exclusão do Livro inserido
DELETE FROM Livro WHERE ISBN = 9788535901111;

------------------------------------------------------------------------------------------

SELECT Livro.Titulo, Categoria.Nome
FROM Livro
JOIN LivroCategoria ON Livro.ISBN = LivroCategoria.ISBN
JOIN Categoria ON LivroCategoria.CategoriaID = Categoria.CategoriaID;




SELECT Livro.Titulo, Autor.Nome
FROM Livro
JOIN LivroAutor ON Livro.ISBN = LivroAutor.ISBN
JOIN Autor ON LivroAutor.AutorID = Autor.AutorID;




SELECT Emprestimo.ID, Usuario.Nome, Emprestimo.DataEmprestimo, Emprestimo.DataDevolucao
FROM Emprestimo
JOIN Usuario ON Emprestimo.CPFUsuario = Usuario.CPF;





SELECT Bibliotecario.Nome, Livro.Titulo
FROM Bibliotecario
JOIN Livro ON Bibliotecario.CPF = Livro.CPFBibliotecario;





SELECT * FROM Livro WHERE NumPaginas > 500;





SELECT Bairro, COUNT(*) as QuantidadeUsuarios
FROM Usuario
GROUP BY Bairro;





SELECT Autor.Nome, Livro.Titulo
FROM Autor
JOIN LivroAutor ON Autor.AutorID = LivroAutor.AutorID
JOIN Livro ON LivroAutor.ISBN = Livro.ISBN;





SELECT * FROM Emprestimo WHERE GETDATE() > DataDevolucao;





SELECT Ano, COUNT(*) as QuantidadeLivros
FROM Livro
GROUP BY Ano;




SELECT Usuario.Nome, Celular.Numero
FROM Usuario
JOIN Celular ON Usuario.CPF = Celular.CPFUsuario;













