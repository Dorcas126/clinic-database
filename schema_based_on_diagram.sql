CREATE DATABASE clinic;

CREATE TABLE patients(
    id int NOT NULL, 
    name VARCHAR(255) NOT NULL,
    date_of_birth date NOT NULL
);
ALTER TABLE "patients" ADD PRIMARY KEY(id);

CREATE TABLE medical_histories(
    id int NOT NULL,
    admitted_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    patient_id INT NOT NULL,
    status VARCHAR(255) NOT NULL,
    CONSTRAINT FK_medical FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE
);
ALTER TABLE medical_histories ADD PRIMARY KEY(id);

CREATE TABLE invoices(
    id int PRIMARY KEY,
    total_amount DECIMAL(8,2)NOT NULL,
    generated_at TIMESTAMP(0)WITHOUT TIME ZONE NOT NULL,
    payed_at TIMESTAMP(0)WITHOUT TIME ZONE NOT NULL,
    medical_history_id INT NOT NULL,
    CONSTRAINT FK_invoice FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE
);

CREATE TABLE treatments(
    id int NOT NULL,
    type VARCHAR(255)NOT NULL,
    name VARCHAR(255)NOT NULL
);
ALTER TABLE treatments ADD PRIMARY KEY(id);

CREATE TABLE invoice_items(
    id SERIAL PRIMARY KEY,
    unit_price decimal(8,2) NOT NULL,
    quantity INTEGER NOT NULL,
    total_price decimal(8,2) NOT NULL,
    invoice_id INTEGER NOT NULL,
    treatment_id int NOT NULL,
    CONSTRAINT FK_invoice_item1 FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
    CONSTRAINT FK_invoice_item2 FOREIGN KEY (treatment_id) REFERENCES treatments(id) ON DELETE CASCADE
);

CREATE TABLE medical_join_treatments (
    medical_history_id INT,
    treatment_id INT,
    CONSTRAINT fk_medical_history FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE,
    CONSTRAINT fk_treatment FOREIGN KEY(treatment_id) REFERENCES treatments(id) ON DELETE CASCADE
);



