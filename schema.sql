CREATE TABLE IF NOT EXISTS submissions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  entry_number TEXT UNIQUE NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  
  -- Payment Information
  payment_status TEXT DEFAULT 'Pending Verification',
  entry_fee TEXT DEFAULT '₹1,000',
  payment_ref TEXT NOT NULL,
  payment_screenshot_data TEXT NOT NULL,
  payment_screenshot_filename TEXT,
  
  -- Film Details
  film_title TEXT NOT NULL,
  genre TEXT NOT NULL,
  film_language TEXT NOT NULL,
  country_of_origin TEXT NOT NULL,
  duration_minutes INTEGER NOT NULL,
  year_of_production INTEGER NOT NULL,
  premiere_status TEXT,
  poster_url TEXT NOT NULL,
  synopsis TEXT NOT NULL,
  
  -- Screening & Technical Specifications
  screener_url TEXT NOT NULL,
  screener_password TEXT,
  subtitles_available TEXT NOT NULL,
  subtitle_language TEXT,
  aspect_ratio TEXT NOT NULL,
  resolution_format TEXT NOT NULL,
  
  -- Director Profile
  director_full_name TEXT NOT NULL,
  director_pro_name TEXT,
  director_email TEXT NOT NULL,
  director_phone TEXT NOT NULL,
  director_location TEXT NOT NULL,
  director_bio TEXT NOT NULL,
  
  -- Producer / Production House
  production_company TEXT,
  producer_name TEXT NOT NULL,
  producer_email TEXT NOT NULL,
  producer_phone TEXT NOT NULL,
  producer_country TEXT NOT NULL,
  
  -- Cinematographer Profile (For Best Cinematographer evaluation)
  dop_full_name TEXT,
  dop_pro_name TEXT,
  dop_email TEXT,
  dop_phone TEXT,
  dop_location TEXT,
  dop_bio TEXT,
  camera_specs TEXT,
  
  -- Key Creative Team (JSON stringified)
  creative_team JSON NOT NULL,
  
  -- Legal & Rights
  rights_holder_name TEXT NOT NULL,
  legal_confirmations JSON NOT NULL
);