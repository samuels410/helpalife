class Addingdistricts < ActiveRecord::Migration
  def change
    District.create!([
                       { name: "Alluri Sitharama Raju", state_id: 2 },
                       { name: "Anakapalli", state_id: 2 },
                       { name: "Annamayya", state_id: 2 },
                       { name: "Bapatla", state_id: 2 },
                       { name: "Dr. B.R. Ambedkar Konaseema", state_id: 2 },
                       { name: "Eluru", state_id: 2 },
                       { name: "Kakinada", state_id: 2 },
                       { name: "Nandyal", state_id: 2 },
                      { name: "NTR", state_id: 2 },
                      { name: "Palnadu", state_id: 2 },
                      { name: "	Parvathipuram Manyam", state_id: 2 },
                      { name: "Sri Sathya Sai", state_id: 2 },
                      { name: "Tirupati", state_id: 2 },
                      { name: "West Siang", state_id: 3 },
                      { name: "Siang", state_id: 3 },
                      { name: "East Siang", state_id: 3 },
                      { name: "Upper Siang", state_id: 3 },
                      { name: "Lower Siang", state_id: 3 },
                      { name: "Namsai", state_id: 3 },
                      { name: "Kra Daadi", state_id: 3 },
                      { name: "Kurung Kumey", state_id: 3 },
                      { name: "Tawang", state_id: 3 },
                      { name: "Longding", state_id: 3 },
                      { name: "Lower Dibang Valley", state_id: 3 },
                      { name: "Itanagar", state_id: 3 },
                      { name: "Kamle", state_id: 3 },
                      { name: "Lepa Rada", state_id: 3 },
                      { name: "Shi Yomi", state_id: 3 },
                      { name: "Pakke Kessang", state_id: 3 },
                      { name: "Leparada", state_id: 3 },
                      { name: "Baksa", state_id: 4 },
                      { name: "Biswanath", state_id: 4 },
                      { name: "Charaideo", state_id: 4 },
                      { name: "Chirang", state_id: 4 },
                      { name: "Hojai", state_id: 4 },
                      { name: "Kamrup Metropolitan", state_id: 4 },
                      { name: "Kamrup Rural", state_id: 4 },
                      { name: "Majuli", state_id: 4 },
                      { name: "South Salmara-Mankachar", state_id: 4 },
                      { name: "Tamulpur", state_id: 4 },
                      { name: "Udalguri", state_id: 4 },
                      { name: "West Karbi Anglong", state_id: 4 },
                      { name: "Bajali", state_id: 4 },
                      { name: "Arwal", state_id: 5 },
                      { name: "Chandigarh", state_id: 6 },
                      { name: "Balod", state_id: 7 },
                      { name: "Baloda Bazar", state_id: 7 },
                      { name: "Balrampur-Ramanujganj", state_id: 7 },
                      { name: "Bemetara", state_id: 7 },
                      { name: "Bijapur", state_id: 7 },
                      { name: "Bilaspur", state_id: 7 },
                      { name: "Gariaband", state_id: 7 },
                      { name: "Gaurela-Pendra-Marwahi", state_id: 7 },
                      { name: "Kondagaon", state_id: 7 },
                      { name: "Mungeli", state_id: 7 },
                      { name: "Narayanpur", state_id: 7 },
                      { name: "Sarangarh-Bilaigarh", state_id: 7 },
                      { name: "Sakti", state_id: 7 },
                      { name: "Sukma", state_id: 7 },
                      { name: "Surajpur", state_id: 7 },
                      { name: "Manendragarh-Chirmiri-Bharatpur", state_id: 7 },
                      { name: "Mohla-Manpur-Ambagarh Chowki", state_id: 7 },
                      { name: "Khairagarh-Chhuikhadan-Gandai", state_id: 7 },
                      { name: "Shahdara", state_id: 10 },
                      { name: "South East Delhi", state_id: 10 },
                      { name: "Aravalli", state_id: 12 },
                      { name: "Banaskantha", state_id: 12},
                      { name: "Bhavnagar", state_id: 12 },
                      { name: "Chhota Udepur", state_id: 12 },
                      { name: "Dahod", state_id: 12 },
                      { name: "Gir Somnath", state_id: 12 },
                      { name: "Jamnagar", state_id: 12 },
                      { name: "Kutch", state_id: 12 },
                      { name: "mahisagar", state_id: 12 },
                      { name: "Charkhi Dadri", state_id: 13 },
                      { name: "Nuh", state_id: 13 },
                      { name: "Hamirpur", state_id: 14 },
                      { name: "Reasi", state_id: 15 },
                      { name: "Shopian", state_id: 15 },
                      { name: "Kishtwar", state_id: 15 },
                      { name: "Jamtara", state_id: 16 },
                      { name: "Khunti", state_id: 16},
                      { name: "Simdega", state_id: 16 },
                      { name: "Latehar", state_id: 16 },
                      { name: "Bagalkot", state_id: 17 },
                      { name: "Alappuzha", state_id: 18 },
                      { name: "Lakshadweep", state_id: 19 },
                      { name: "Agar Malwa", state_id: 20 },
                      { name: "Niwari", state_id: 20 },
                      { name: "Mauganj", state_id: 20 },
                      { name: "Maihar", state_id: 20 },
                      { name: "Palghar", state_id: 21 },
                      { name: "Aurangabad", state_id: 21 },
                      { name: "Jiribam", state_id: 22 },
                      { name: "Kakching", state_id: 22 },
                      { name: "Kamjong", state_id: 22 },
                      { name: "Kangpokpi", state_id: 22 },
                      { name: "Noney", state_id: 22 },
                      { name: "Pherzawl", state_id: 22 },
                      { name: "Tengnoupal", state_id: 22 },
                      { name: "North Garo Hills", state_id: 23 },
                      { name: "South West Garo Hills", state_id: 23 },
                      { name: "South West Khasi Hills", state_id: 23 },
                      { name: "East Jaintia Hills", state_id: 23 },
                      { name: "Eastern West Khasi Hills", state_id: 23 },
                      { name: "Hnahthial", state_id: 24 },
                      { name: "Khawzawl", state_id: 24 },
                      { name: "Saitual", state_id: 24 },
                      { name: "Chümoukedima", state_id: 25 },
                      { name: "Kiphire", state_id: 25 },
                      { name: "Longleng", state_id: 25 },
                      { name: "Niuland", state_id: 25 },
                      { name: "Noklak", state_id: 25 },
                      { name: "Peren", state_id: 25 },
                      { name: "Shamator", state_id: 25 },
                      { name: "Tseminyü", state_id: 25 },
                      { name: "Gajapati", state_id: 26 },
                      { name: "Barnala", state_id: 28 },
                      { name: "Fazilka", state_id: 28 },
                      { name: "Malerkotla", state_id: 28 },
                      { name: "Pathankot", state_id: 28 },
                      { name: "S.A.S. Nagar", state_id: 28 },
                      { name: "Tarn Taran", state_id: 28 },
                      { name: "Balotra", state_id: 29 },
                      { name: "Beawar", state_id: 29 },
                      { name: "Deeg", state_id: 29 },
                      { name: "Didwana-Kuchaman", state_id: 29 },
                      { name: "Khairthal-Tijara", state_id: 29 },
                      { name: "Kotputli-Behror", state_id: 29 },
                      { name: "Phalodi", state_id: 29 },
                      { name: "Pratapgarh", state_id: 29 },
                      { name: "Salumbar", state_id: 29 },
                      { name: "Pakyong", state_id: 30 },
                      { name: "Soreng", state_id: 30 },
                      { name: "Chengalpattu", state_id: 31 },
                      { name: "Kallakurichi", state_id: 31 },
                      { name: "Krishnagiri", state_id: 31 },
                      { name: "Mayiladuthurai", state_id: 31 },
                      { name: "Ranipet", state_id: 31 },
                      { name: "Tenkasi", state_id: 31 },
                      { name: "Tirupathur", state_id: 31 },
                      { name: "Virudhunagar", state_id: 31 },
                      { name: "Dhalai", state_id: 32 },
                      { name: "Khowai", state_id: 32 },
                      { name: "Sipahijala", state_id: 32 },
                      { name: "Gomati", state_id: 32 },
                      { name: "Unakoti", state_id: 32 },
                      { name: "Amethi", state_id: 34 },
                      { name: "Amroha", state_id: 34 },
                      { name: "Hapur", state_id: 34 },
                      { name: "Kasganj", state_id: 34 },
                      { name: "Shamli", state_id: 34 },
                      { name: "Alipurduar", state_id: 35 },
                      { name: "Jhargram", state_id: 35 },
                      { name: "Kalimpong", state_id: 35 },
                      { name: "Paschim Bardhaman", state_id: 35 },
                      { name: "Purba Bardhaman", state_id: 35 },
                      { name: "Dadra and Nagar Haveli", state_id: 39 },
                      { name: "Daman", state_id: 39 },
                      { name: "Diu", state_id: 39 },
                      { name: "Bhadradri Kothagudem", state_id: 40 },
                      { name: "Hanumakonda", state_id: 40 },
                      { name: "Jagtial", state_id: 40 },
                      { name: "Jangaon", state_id: 40 },
                      { name: "Jayashankar Bhupalpally", state_id: 40 },
                      { name: "Jogulamba Gadwal", state_id: 40 },
                      { name: "Kamareddy", state_id: 40 },
                      { name: "Komaram Bheem Asifabad", state_id: 40 },
                      { name: "Mahabubabad", state_id: 40 },
                      { name: "Mancherial", state_id: 40 },
                      { name: "Medchal–Malkajgiri", state_id: 40 },
                      { name: "Mulugu", state_id: 40 },
                      { name: "Nagarkurnool", state_id: 40 },
                      { name: "Narayanpet", state_id: 40 },
                      { name: "Nirmal", state_id: 40 },
                      { name: "Peddapalli", state_id: 40 },
                      { name: "Rajanna Sircilla", state_id: 40 },
                      { name: "Sangareddy", state_id: 40 },
                      { name: "Rajanna Sircilla", state_id: 40 },
                      { name: "Sangareddy", state_id: 40 },
                      { name: "Siddipet", state_id: 40 },
                      { name: "Suryapet", state_id: 40 },
                      { name: "Vikarabad", state_id: 40 },
                      { name: "Wanaparthy", state_id: 40 },
                      { name: "Yadadri Bhuvanagiri", state_id: 40 },
                      { name: "Leh", state_id: 41 },
                      { name: "Kargil", state_id: 41 },
                      { name: "Ganderbal ", state_id: 15 },
                      { name: "Narmadapuram ", state_id: 20 },
                      { name: "Ahilyanagar ", state_id: 21 }
                     ])
    District.where(name: "Bastar").update_all(state_id: 7)
    District.where(name: "Dantewada").update_all(state_id: 7)
    District.where(name: "Dhamtari").update_all(state_id: 7)
    District.where(name: "Durg").update_all(state_id: 7)
    District.where(name: "Jashpur").update_all(state_id: 7)
    District.where(name: "Janjgir-Champa").update_all(state_id: 7)
    District.where(name: "Korba").update_all(state_id: 7)
    District.where(name: "Koriya").update_all(state_id: 7)
    District.where(name: "Kanker").update_all(state_id: 7)
    District.where(name: "Kawardha").update_all(state_id: 7)
    District.where(name: "Mahasamund").update_all(state_id: 7)
    District.where(name: "Raigarh").update_all(state_id: 7)
    District.where(name: "Rajnandgaon").update_all(state_id: 7)
    District.where(name: "Raipur").update_all(state_id: 7)
    District.where(name: "Surguja").update_all(state_id: 7)
    District.where(name: "Aurangabad").update_all(state_id: 5)
    District.where(name: "Adilabad").update_all(state_id: 40)
    District.where(name: "Khammam").update_all(state_id: 40)
    District.where(name: "Mahbubnagar").update_all(state_id: 40)
    District.where(name: "Medak").update_all(state_id: 40)
    District.where(name: "Nalgonda").update_all(state_id: 40)
    District.where(name: "Nizamabad").update_all(state_id: 40)
    District.where(name: "Rangareddi").update_all(state_id: 40)
    District.where(name: "Warangal").update_all(state_id: 40)
    District.where(name: "Karimnagar").update_all(state_id: 40)
    District.where(name: "Hyderabad").update_all(state_id: 40)


  end
end
