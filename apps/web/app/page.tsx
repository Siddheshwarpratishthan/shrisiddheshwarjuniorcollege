export default function Home() {
  return (
    <main style={{ padding: 24, fontFamily: 'Inter, sans-serif', background: '#0D2A62', color: '#fff', minHeight: '100vh' }}>
      <h1>Vibrant Academy Baramati - Super Admin Dashboard (MVP)</h1>
      <p>Modules: Admissions, Fees, Attendance, Tests, CRM</p>
      <section style={{ display: 'grid', gridTemplateColumns: 'repeat(3, minmax(0, 1fr))', gap: 16, marginTop: 20 }}>
        {['Student Strength', 'Fee Collection', 'Attendance %', 'Lead Conversion', 'Test Avg', 'At-Risk Students'].map((k) => (
          <div key={k} style={{ background: '#fff', color: '#0D2A62', padding: 16, borderRadius: 12 }}>
            <h3>{k}</h3><p>Live KPI widget</p>
          </div>
        ))}
      </section>
    </main>
  );
}
