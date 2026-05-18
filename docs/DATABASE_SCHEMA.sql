-- Core schema (PostgreSQL)
CREATE TABLE branches (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  code TEXT UNIQUE NOT NULL,
  city TEXT NOT NULL,
  state TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE roles (
  id UUID PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE users (
  id UUID PRIMARY KEY,
  branch_id UUID REFERENCES branches(id),
  role_id UUID REFERENCES roles(id),
  full_name TEXT NOT NULL,
  email TEXT UNIQUE,
  phone TEXT UNIQUE NOT NULL,
  password_hash TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE students (
  id UUID PRIMARY KEY,
  branch_id UUID REFERENCES branches(id),
  admission_no TEXT UNIQUE NOT NULL,
  full_name TEXT NOT NULL,
  dob DATE,
  course TEXT NOT NULL,
  batch TEXT,
  parent_name TEXT,
  parent_phone TEXT,
  status TEXT DEFAULT 'active',
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE admissions (
  id UUID PRIMARY KEY,
  student_id UUID REFERENCES students(id),
  form_data JSONB NOT NULL,
  documents JSONB,
  scholarship_percent NUMERIC(5,2) DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE fee_invoices (
  id UUID PRIMARY KEY,
  student_id UUID REFERENCES students(id),
  total_amount NUMERIC(12,2) NOT NULL,
  discount_amount NUMERIC(12,2) DEFAULT 0,
  gst_amount NUMERIC(12,2) DEFAULT 0,
  due_date DATE,
  status TEXT DEFAULT 'pending',
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE fee_payments (
  id UUID PRIMARY KEY,
  invoice_id UUID REFERENCES fee_invoices(id),
  amount NUMERIC(12,2) NOT NULL,
  mode TEXT NOT NULL,
  reference_no TEXT,
  payment_date TIMESTAMPTZ DEFAULT now(),
  receipt_no TEXT UNIQUE NOT NULL
);

CREATE TABLE attendance_records (
  id UUID PRIMARY KEY,
  student_id UUID REFERENCES students(id),
  attendance_date DATE NOT NULL,
  status TEXT NOT NULL,
  marked_by UUID REFERENCES users(id)
);

CREATE TABLE tests (
  id UUID PRIMARY KEY,
  branch_id UUID REFERENCES branches(id),
  name TEXT NOT NULL,
  exam_pattern TEXT NOT NULL,
  total_marks INTEGER,
  negative_marking NUMERIC(4,2),
  scheduled_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE test_results (
  id UUID PRIMARY KEY,
  test_id UUID REFERENCES tests(id),
  student_id UUID REFERENCES students(id),
  score NUMERIC(8,2),
  percentile NUMERIC(5,2),
  rank_in_branch INTEGER,
  subject_breakup JSONB,
  ai_insights JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE leads (
  id UUID PRIMARY KEY,
  branch_id UUID REFERENCES branches(id),
  source TEXT,
  full_name TEXT,
  phone TEXT,
  course_interest TEXT,
  status TEXT DEFAULT 'new',
  counselor_id UUID REFERENCES users(id),
  followup_at TIMESTAMPTZ,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE audit_logs (
  id UUID PRIMARY KEY,
  actor_user_id UUID REFERENCES users(id),
  action TEXT NOT NULL,
  entity_type TEXT NOT NULL,
  entity_id UUID,
  metadata JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_students_branch_course ON students(branch_id, course);
CREATE INDEX idx_fee_invoices_due_status ON fee_invoices(due_date, status);
CREATE INDEX idx_attendance_student_date ON attendance_records(student_id, attendance_date);
CREATE INDEX idx_tests_branch_scheduled ON tests(branch_id, scheduled_at);
CREATE INDEX idx_leads_status_followup ON leads(status, followup_at);
