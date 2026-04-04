# Run Book: <Product Name>

> Keep this document up to date. It is the first thing consulted when
> something goes wrong in production.

## Run locally

### Prerequisites
<!-- List exact tools, versions, and credentials needed -->

### Steps
```bash
# Clone and install
# ...

# Configure environment
cp .env.example .env
# Edit .env with your values

# Run
# ...
```

### Verify it's working
<!-- What does a healthy local instance look like? -->

---

## Deploy

### Prerequisites
<!-- Credentials, access, and tools required to deploy -->

### Trigger a deployment
```bash
# ...
```

### Verify the deployment succeeded
<!-- URL to check, health endpoint, expected output -->

### Roll back
```bash
# How to revert to the previous version if the deployment is bad
```

---

## Recover from failure

### The app is down / returning 5xx
1. Check logs: <!-- where to find them -->
2. Common causes and fixes:
   - **Cause**: <!-- symptom --> → **Fix**: <!-- action -->

### The database is unavailable
1. <!-- steps -->

### A deployment is stuck or failed
1. <!-- steps -->

### Data loss or corruption
1. Stop writes immediately: <!-- how -->
2. Assess scope: <!-- how -->
3. Restore from backup: <!-- how and where backups are -->

---

*Last updated: <!-- date --> by <!-- agent or person -->*
