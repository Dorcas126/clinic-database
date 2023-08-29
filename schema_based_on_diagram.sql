CREATE TABLE patients(id int NOT NULL, name VARCHAR(255) NOT NULL, date_of_birth date NOT NULL);
ALTER TABLE "patients" ADD PRIMARY KEY(id);
CREATE TABLE treatments(id int NOT NULL, type VARCHAR(255)NOT NULL,name VARCHAR(255)NOT NULL);
ALTER TABLE treatments ADD PRIMARY KEY(id);
CREATE TABLE invoice_items(id int NOT NULL,unit_price decimal(8,2) NOT NULL,quantity INTEGER NOT NULL,total_price decimal(8,2) NOT NULL,invoice_id INTEGER NOT NULL,treatment_id int NOT NULL);
ALTER TABLE invoice_items ADD PRIMARY KEY(id);

CREATE TABLE medical_histories(id int NOT NULL,admitted_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,patient_id INT NOT NULL,status VARCHAR(255)NOT NULL);
ALTER TABLE medical_histories ADD PRIMARY KEY(id);

CREATE TABLE invoices(id int NOT NULL,total_amount DECIMAL(8,2)NOT NULL,generated_at TIMESTAMP(0)WITHOUT TIME ZONE NOT NULL,payed_at TIMESTAMP(0)WITHOUT TIME ZONE NOT NULL,medical_history__id INT NOT NULL);

ADD constraint FK_medical Foreign Key (patient_id) REFERENCES patients(id);
ADD constraint FK_invoice Foreign Key (medical_history_id) REFERENCES medical_histories(id);

ADD constraint FK_invoice-item1 Foreign Key (invoice_id) REFERENCES invoice(id);
ADD constraint FK_invoice-item2 Foreign Key (treatment_id) REFERENCES treaments(id);

