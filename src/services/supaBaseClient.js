import {createClient} from '@supabase/supabase-js'

const supabaseURL="https://temporal.supabase.co"//despues le colocamos las variables de entorno de los .env
const supabaseKey="ejemploKeyTemporal_4243"//solo es definiendo estructura

export const peticionSupa= createClient(supabaseURL, supabaseKey)