# Karuvelam Map-to-Money
### AI-Powered Seemai Karuvelam Mapping, Biomass Estimation, Whole-Tree Resource Recovery and Rural Income Platform

[![Tests](https://img.shields.io/badge/tests-20%20backend%20%7C%208%20frontend-brightgreen)](#automated-testing)
[![Python](https://img.shields.io/badge/python-3.12-blue)](https://python.org)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.115+-009688)](https://fastapi.tiangolo.com)
[![React](https://img.shields.io/badge/React-19.3-61DAFB)](https://react.dev)
[![Leaflet](https://img.shields.io/badge/Leaflet-1.9-green)](https://leafletjs.com)
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](LICENSE)

**Karuvelam Map-to-Money** is an environmental technology, geospatial intelligence, and rural resource recovery web application focused on Seemai Karuvelam (*Prosopis juliflora*) in Tamil Nadu, India.

Central Project Slogan:
> *"Map the Invasion. Measure the Resource. Connect the Market. Monitor the Recovery."*

The application bridges invasive-plant management with responsible biomass recovery and rural economic opportunities without assuming that every stand should be cleared, every tree component should be separated, or every commercial use will be profitable. It is a decision-support and feasibility tool, not an automatic clearance authorization system.

---

## Architecture & Technology Stack

- **Frontend:** React 19, TypeScript, Vite, Tailwind CSS v4, Lucide Icons, Recharts, Leaflet / React-Leaflet
- **Backend API:** Python 3.12, FastAPI, Uvicorn, Pydantic v2
- **Geospatial Processing:** PyProj (geodesic ellipsoidal area on WGS84), Shapely, GeoJSON validation & normalization
- **Machine Learning:** scikit-learn (Random Forest multispectral classifier with spatial block cross-validation)
- **Database:** SQLite (`karuvelam.db`) with relational foreign keys, cascade constraints, and query indexes
- **Testing:** Pytest (20 backend integration, calculation, geospatial, materials, and E2E tests) and Vitest (8 frontend calculation tests)

---

## 10 Core Application Modules

| Module | Navigation | Feature Description |
| :--- | :--- | :--- |
| **1. Dashboard** | `Dashboard` | Real-time environmental & economic indicators: mapped area (ha), suspected stands, verified stands, pending ground checks, recoverable biomass, net financial return, area-by-status distribution, and weighbridge harvest calibration. |
| **2. Detection Map** | `Detection Map` | Interactive Leaflet GIS map with Esri Satellite and OpenStreetMap tile layers, geodesic polygons, confidence coloring, popup attributes, search drawer, and GeoJSON polygon import. |
| **3. Patch Inventory** | `Patch Inventory` | Searchable tabular registry with filters for district, verification status, lifecycle stage, canopy density, and area range; sorting, pagination, and direct CSV export. |
| **4. Patch Details** | `Patch Details` | Contextual drill-down on selected stand: geodesic acreage, sensitivity buffer check, biomass sensitivity ranges, product conversion breakdown, field inspection history, and 5-point legal safeguards checklist modal. |
| **5. Biomass & Profit** | `Biomass & Profit Calc` | Reusable techno-economic calculator: area, canopy density, recovery fraction, product pathways (raw chips, charcoal, pellets, firewood), itemized costs (cutting, loading, transport, labour), break-even price, and negative profit warnings. |
| **6. Resource Recovery** | `Resource Recovery` | **Core Whole-Tree Module**: Configurable allocation across all 9 tree components (trunk, branches, pods, seeds, seed gum, bark, leaves, roots, residues); real-time mass balance meter (Total = Accounted + Unallocated); double-counting guards; and side-by-side comparison of Option A (Bulk), Option B (Separated), and Option C (High-Value Processing) with transparent recommendation logic. |
| **7. Buyer Marketplace** | `Buyer Marketplace` | Directory of regional offtakers with accepted materials, indicative prices per tonne, quantity ranges, delivery terms, prominent `DEMO BUYER — NOT A REAL COMMERCIAL OFFER` badges, and Expression of Interest (EOI) submission. |
| **8. Field Verification** | `Field Verification` | Mobile-responsive ground inspection workflow: browser geolocation GPS auto-fetch or manual coordinates, vegetation classification, 10x10m sample plot stem metrics (height, DBH), weighbridge harvest entries, and photo documentation. |
| **9. Regrowth Monitoring** | `Regrowth Monitoring` | Post-clearing surveillance scheduler: logging days post-clearing, canopy cover %, Sentinel-2 NDVI, coppicing severity, and roguing/stump treatment recommendations. |
| **10. Reports & Accuracy** | `Reports & Accuracy` | Spatial block model validation report (accuracy, macro/weighted F1, confusion matrix, feature importances), and one-click downloads for Patches CSV, Biomass CSV, Materials CSV, Clearing Transactions CSV, and GIS GeoJSON. |

---

## Quick Start: Local Run Instructions

### Prerequisites
- Python 3.12
- Node.js 18+ or 20+ with npm

### 1. Launch Backend (FastAPI)
```powershell
# In project root:
.\.venv\Scripts\Activate.ps1

# Install requirements if not already installed:
pip install -r requirements.txt

# Start backend on port 8010
python -m uvicorn backend.main:app --host 0.0.0.0 --port 8010 --reload
```
API runs at: **`http://127.0.0.1:8010`** (or **`http://localhost:8010`**)
Swagger docs: **`http://127.0.0.1:8010/docs`**

### 2. Launch Frontend (React + Vite)
In a second terminal window:
```powershell
cd frontend
npm install
npm run dev -- --host 0.0.0.0 --port 5180
```
Frontend runs at: **`http://localhost:5180`** (or **`http://127.0.0.1:5180`**)

---

## Automated Testing Suite

### Backend Tests (Pytest — 20 Tests)
Run all backend tests:
```powershell
.\.venv\Scripts\pytest -v
```
Test Coverage:
- `tests/test_api.py`: Health endpoint, dashboard summary, patch listing, GeoJSON output, buyer listings, model evaluation metrics.
- `tests/test_calculations.py`: Standing and recoverable biomass, harvest calibration, itemized operational costs, charcoal conversion yield factor (0.25), and negative profit scenario warnings.
- `tests/test_geospatial.py`: Geodesic ellipsoidal area calculations (WGS84) and GeoJSON polygon validation/normalization.
- `tests/test_materials.py`: All 9 whole-tree material categories, mass balance accounting, unallocated quantity calculations, over-allocation warnings, prevention of double-counting (pods vs seeds), and recovery scenario database persistence.
- `tests/test_e2e.py`: 12-step full lifecycle integration workflow: patch inspection, calculations, field observation submission, legal clearance checklist, clearing execution, multi-stream resource recovery scenario, buyer enquiry submission, regrowth monitoring inspection, CSV/GeoJSON export, and persistence verification across fresh database connections.

### Frontend Tests (Vitest — 8 Tests)
Run frontend tests:
```powershell
npm --prefix frontend test
```
Test Coverage:
- Gross biomass revenue calculations
- Charcoal conversion yields
- Itemized operational cost aggregation and net margins
- Break-even selling price per tonne
- Whole-tree 9-stream mass balance summing and unallocated mass tracking
- Over-allocation detection (>100% of input)
- Potential double-counting detection (whole pods vs extracted seeds)
- Option A (bulk) vs Option B (separated) vs Option C (processed) financial comparison logic

---

## Standalone Machine Learning Pipeline

To train the Random Forest multispectral classifier with spatial block cross-validation:
```powershell
.\.venv\Scripts\python.exe ml/train_model.py --samples-per-site 50 --trees 60
```
Outputs:
- Reference training dataset: `ml/training_reference_samples.csv`
- Serialized model artifact: `ml/karuvelam_rf_model.joblib`
- Independent test metrics and confusion matrix: `ml/evaluation_summary.json`

---

## Scientific Validity & Ethical Guidelines

- **Demonstration Data:** All demonstration records are seeded in known Prosopis juliflora invasion hotspots in Southern Tamil Nadu (Ramanathapuram, Sivaganga, Thoothukudi). Fictional demonstration buyers are prominently marked with: `DEMO BUYER — NOT A REAL COMMERCIAL OFFER`.
- **Area Computation:** Hectares are never calculated by multiplying degrees. The platform uses PyProj geodesic calculations over the WGS84 ellipsoid.
- **Biomass Accounting:** Standing biomass is derived from published empirical destructive allometric harvest tables (Forest College & Research Institute, TNAU, and Forest Research Institute, Dehradun). Literature assumptions are clearly separated from weighbridge field measurements.
- **Whole-Tree Recovery:** Seed gum and bark tannins are identified as research-stage applications. The platform prevents double-counting between whole pods and extracted seeds.
- **Clearing Safeguards:** Statutory confirmation (landowner consent, revenue department clearance, forest boundary check, sensitive waterbody buffer review) is required before a patch can be marked approved for clearing.
