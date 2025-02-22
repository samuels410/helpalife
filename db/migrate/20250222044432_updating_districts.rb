class UpdatingDistricts < ActiveRecord::Migration
  def change
    state_andhra = State.find_by(name: "Andhra Pradesh")
    if state_andhra.present?
      andhra_district_names = [
        "Alluri Sitharama Raju", "Anakapalli", "Annamayya", "Bapatla",
        "Kakinada", "Nandyal", "NTR", "Palnadu",
        "Parvathipuram Manyam", "Sri Sathya Sai", "Tirupati"
      ]
      andhra_district_names.each do |andhra_district_name|
        district_alluri = District.where(name: andhra_district_name).first_or_create!
        district_alluri.update(state_id: state_andhra.id)
      end
    end

    state_arunachal = State.find_by(name: "Arunachal Pradesh")
    if state_arunachal.present?
      arunachal_district_names = [
        "Kra Daadi", "Kurung Kumey", "Tawang", "Longding", "Lower Dibang Valley",
        "Itanagar", "Kamle", "Lepa Rada", "Shi Yomi", "Pakke Kessang",
        "Leparada", "West Siang", "Lower Siang", "Siang",
        "Upper Siang", "Namsai"
      ]
      arunachal_district_names.each do |arunachal_district_name|
        district_kra_daadi = District.where(name: arunachal_district_name).first_or_create!
        district_kra_daadi.update(state_id: state_arunachal.id)
      end
    end

    state_assam = State.find_by(name: "Assam")
    if state_assam.present?
      assam_district_names = [
        "Baksa", "Biswanath", "Charaideo", "Chirang", "Hojai",
        "Kamrup Metropolitan", "Kamrup Rural", "Majuli",
        "South Salmara-Mankachar", "Tamulpur", "Udalguri",
        "West Karbi Anglong", "Bajali"
      ]
      assam_district_names.each do |assam_district_name|
        district_baksa = District.where(name: assam_district_name).first_or_create!
        district_baksa.update(state_id: state_assam.id)
      end
    end

    state_Bihar = State.find_by(name: "Bihar")
    if state_Bihar.present?
      bihar_districts_names = ["Arwal", "West Champaran"]
      bihar_districts_names.each do |bihar_districts_name|
        district_arwal = District.where(name: bihar_districts_name).first_or_create!
        district_arwal.update(state_id: state_Bihar.id)
      end
    end

    state_chandigarh = State.find_by(name: "Chandigarh")
    if state_chandigarh.present?
      district_chandigarh_names = ["Chandigarh"]
      district_chandigarh_names.each do |district_chandigarh_name|
        district_chandigarh = District.where(name: district_chandigarh_name).first_or_create!
        district_chandigarh.update(state_id: state_chandigarh.id)
      end
    end

    state_chhattisgarh = State.find_by(name: "Chhattisgarh")
    if state_chhattisgarh.present?
      chhattisgarh_names = [
        "Balod", "Baloda Bazar", "Balrampur-Ramanujganj", "Bemetara", "Bijapur",
        "Bilaspur", "Gariaband", "Gaurela-Pendra-Marwahi", "Kondagaon", "Mungeli",
        "Narayanpur", "Sarangarh-Bilaigarh", "Sakti", "Sukma", "Surajpur",
        "Manendragarh-Chirmiri-Bharatpur", "Mohla-Manpur-Ambagarh Chowki",
        "Khairagarh-Chhuikhadan-Gandai", "Kabirdham", "Dantewada"
      ]
      chhattisgarh_names.each do |chhattisgarh_name|
        district_balod = District.where(name: chhattisgarh_name).first_or_create!
        district_balod.update(state_id: state_chhattisgarh.id)
      end
    end

    state_delhi = State.find_by(name: "Delhi")
    if state_delhi.present?
      delhi_district_names = ["Shahdara", "South East Delhi"]
      delhi_district_names.each do |delhi_district_name|
        district_shahdara = District.where(name: delhi_district_name).first_or_create!
        district_shahdara.update(state_id: state_delhi.id)
      end
    end
    state_gujarat = State.find_by(name: "Gujarat")
    if state_gujarat.present?
      gujarat_district_names = [
        "Aravalli", "Banaskantha", "Bhavnagar", "Chhota Udepur", "Dahod",
        "Gir Somnath", "Jamnagar", "Kutch", "Mahisagar", "Botad",
        "Devbhoomi Dwarka", "Morbi", "Tapi"
      ]
      gujarat_district_names.each do |gujarat_district_name|
        district_aravalli = District.where(name: gujarat_district_name).first_or_create!
        district_aravalli.update(state_id: state_gujarat.id)
      end
    end
    state_haryana = State.find_by(name: "Haryana")
    if state_haryana.present?
      haryana_districts_names = ["Charkhi Dadri", "Nuh"]
      haryana_districts_names.each do |haryana_districts_name|
        district_charkhi_dadri = District.where(name: haryana_districts_name).first_or_create!
        district_charkhi_dadri.update(state_id: state_haryana.id)
      end
    end

    state_himachal = State.find_by(name: "Himachal Pradesh")
    if state_himachal.present?
      himachal_district_names = ["Hamirpur", "Bilaspur"]
      himachal_district_names.each do |himachal_district_name|
        district_hamirpur = District.where(name: himachal_district_name).first_or_create!
        district_hamirpur.update(state_id: state_himachal.id)
      end
    end

    state_jammu_kashmir = State.find_by(name: "Jammu and Kashmir")
    if state_jammu_kashmir.present?
      jammu_districts_names = ["Reasi", "Shopian", "Kishtwar", "Ganderbal", "Ramban", "Kulgam"]
      jammu_districts_names.each do |jammu_districts_name|
        district_reasi = District.where(name: jammu_districts_name).first_or_create!
        district_reasi.update(state_id: state_jammu_kashmir.id)
      end

    end

    state_jharkhand = State.find_by(name: "Jharkhand")
    if state_jharkhand.present?
      jharkhand_district_names = ["Jamtara", "Khunti", "Simdega", "Latehar"]
      jharkhand_district_names.each do |jharkhand_district_name|
        district_jamtara = District.where(name: jharkhand_district_name).first_or_create!
        district_jamtara.update(state_id: state_jharkhand.id)
      end
    end

    state_karnataka = State.find_by(name: "Karnataka")
    if state_karnataka.present?
      karnataka_districts_names = ["Bagalkot", "Belagavi"]
      karnataka_districts_names.each do |karnataka_districts_name|
        district_bagalkot = District.where(name: karnataka_districts_name).first_or_create!
        district_bagalkot.update(state_id: state_karnataka.id)
      end
    end

    state_kerala = State.find_by(name: "Kerala")
    if state_kerala.present?
      kerala_district_names = ["Alappuzha"]
      kerala_district_names.each do |kerala_district_name|
        district_alappuzha = District.where(name: kerala_district_name).first_or_create!
        district_alappuzha.update(state_id: state_kerala.id)
      end
    end
    state_lakshadweep = State.find_by(name: "Lakshadweep")
    if state_lakshadweep.present?
      lakshadweep_districts_names = ["Lakshadweep"]
      lakshadweep_districts_names.each do |lakshadweep_districts_name|
        district_lakshadweep = District.where(name: lakshadweep_districts_name).first_or_create!
        district_lakshadweep.update(state_id: state_lakshadweep.id)
      end
    end

    state_madhya_pradesh = State.find_by(name: "Madhya Pradesh")
    if state_madhya_pradesh.present?
      madhya_pradesh_district_names = ["Agar Malwa", "Niwari", "Mauganj", "Maihar", "Narmadapuram", "Ahilyanagar"]
      madhya_pradesh_district_names.each do |madhya_pradesh_district_name|
        district_agar_malwa = District.where(name: madhya_pradesh_district_name).first_or_create!
        district_agar_malwa.update(state_id: state_madhya_pradesh.id)
      end
    end

    state_maharashtra = State.find_by(name: "Maharashtra")
    if state_maharashtra.present?
      maharashtra_district_names = ["Palghar", "Aurangabad"]
      maharashtra_district_names.each do |maharashtra_district_name|
        district_palghar = District.where(name: maharashtra_district_name).first_or_create!
        district_palghar.update(state_id: state_maharashtra.id)
      end
    end

    state_manipur = State.find_by(name: "Manipur")
    if state_manipur.present?
      manipur_district_names = ["Jiribam", "Kakching", "Kamjong", "Kangpokpi", "Noney", "Pherzawl", "Tengnoupal"]
      manipur_district_names.each do |manipur_district_name|
        district_jiribam = District.where(name: manipur_district_name).first_or_create!
        district_jiribam.update(state_id: state_manipur.id)
      end
    end

    state_meghalaya = State.find_by(name: "Meghalaya")
    if state_meghalaya.present?
      district_meghalaya_names = ["North Garo Hills", "South West Garo Hills", "South West Khasi Hills", "East Jaintia Hills",
                                  "Eastern West Khasi Hills"]
      district_meghalaya_names.each do |district_meghalaya_name|
        district_north_garo_hills = District.where(name: district_meghalaya_name).first_or_create!
        district_north_garo_hills.update(state_id: state_meghalaya.id)
      end
    end

    state_mizoram = State.find_by(name: "Mizoram")
    if state_mizoram.present?
      mizoram_districts_names = ["Hnahthial", "Khawzawl", "Saitual"]
      mizoram_districts_names.each do |mizoram_districts_name|
        district_hnahthial = District.where(name: mizoram_districts_name).first_or_create!
        district_hnahthial.update(state_id: state_mizoram.id)
      end
    end

    state_nagaland = State.find_by(name: "Nagaland")
    if state_nagaland.present?
      nagaland_district_names = ["Chümoukedima", "Kiphire", "Longleng", "Niuland", "Noklak", "Peren", "Shamator", "Tseminyü"]
      nagaland_district_names.each do |nagaland_district_name|
        district_chumoukedima = District.where(name: nagaland_district_name).first_or_create!
        district_chumoukedima.update(state_id: state_nagaland.id)
      end
    end

    state_odisha = State.find_by(name: "Orissa")
    if state_odisha.present?
      odisha_district_names = ["Gajapati"]
      odisha_district_names.each do |odisha_district_name|
        district_gajapati = District.where(name: odisha_district_name).first_or_create!
        district_gajapati.update(state_id: state_odisha.id)
      end
    end

    state_punjab = State.find_by(name: "Punjab")
    if state_punjab.present?
      district_punjab_names = ["Barnala", "Fazilka", "Malerkotla", "Pathankot", "S.A.S. Nagar", "Tarn Taran"]
      district_punjab_names.each do |district_punjab_name|
        district_barnala = District.where(name: district_punjab_name).first_or_create!
        district_barnala.update(state_id: state_punjab.id)
      end
    end

    state_rajasthan = State.find_by(name: "Rajasthan")
    if state_rajasthan.present?
      rajasthan_districts_names = ["Balotra", "Beawar", "Deeg", "Didwana-Kuchaman", "Khairthal-Tijara", "Kotputli-Behror", "Phalodi",
                                   "Pratapgarh", "Salumbar"]
      rajasthan_districts_names.each do |rajasthan_districts_name|
        district_balotra = District.where(name: rajasthan_districts_name).first_or_create!
        district_balotra.update(state_id: state_rajasthan.id)
      end
    end

    state_sikkim = State.find_by(name: "Sikkim")
    if state_sikkim.present?
      sikkim_district_names = ["Pakyong", "Soreng"]
      sikkim_district_names.each do |sikkim_district_name|
        district_pakyong = District.where(name: sikkim_district_name).first_or_create!
        district_pakyong.update(state_id: state_sikkim.id)
      end
    end

    state_tamil_nadu = State.find_by(name: "Tamil Nadu")
    if state_tamil_nadu.present?
      tamilnadu_district_names = ["Chengalpattu", "Kallakurichi", "Krishnagiri", "Mayiladuthurai", "Ranipet", "Tenkasi", "Tirupathur", "Virudhunagar"]
      tamilnadu_district_names.each do |tamilnadu_district_name|
        district_chengalpattu = District.where(name: tamilnadu_district_name).first_or_create!
        district_chengalpattu.update(state_id: state_tamil_nadu.id)
      end
    end

    state_tripura = State.find_by(name: "Tripura")
    if state_tripura.present?
      tripura_district_names = ["Dhalai", "Khowai", "Sipahijala", "Gomati", "Unakoti"]
      tripura_district_names.each do |tripura_district_name|
        district_dhalai = District.where(name: tripura_district_name).first_or_create!
        district_dhalai.update(state_id: state_tripura.id)
      end
    end

    state_uttar_pradesh = State.find_by(name: "Uttar Pradesh")
    if state_uttar_pradesh.present?
      uttarpradesh_districts_names = ["Amethi", "Amroha", "Hapur", "Kasganj", "Shamli"]
      uttarpradesh_districts_names.each do |uttarpradesh_districts_name|
        district_amethi = District.where(name: uttarpradesh_districts_name).first_or_create!
        district_amethi.update(state_id: state_uttar_pradesh.id)
      end
    end

    state_west_bengal = State.find_by(name: "West Bengal")
    if state_west_bengal.present?
      westbengal_districts_names = ["Alipurduar", "Jhargram", "Kalimpong", "Paschim Bardhaman", "Purba Bardhaman", "Hanumakonda", "Suryapet", "Jangaon"]
      westbengal_districts_names.each do |westbengal_districts_name|
        district_alipurduar = District.where(name: westbengal_districts_name).first_or_create!
        district_alipurduar.update(state_id: state_west_bengal.id)
      end
    end

    state_dadra_nagar_haveli_daman_diu = State.find_by(name: "Dadra and Nagar Haveli and Daman and Diu")
    if state_dadra_nagar_haveli_daman_diu.present?
      district_dadra = ["Dadra and Nagar Haveli", "Daman", "Diu"]
      district_dadra.each do |district_dadranager|
        district_dadra_nagar_haveli = District.where(name: district_dadranager).first_or_create!
        district_dadra_nagar_haveli.update(state_id: state_dadra_nagar_haveli_daman_diu.id)
      end
    end

    state_telangana = State.find_by(name: "Telangana")
    if state_telangana.present?
      telangana_district_names = ["Bhadradri Kothagudem", "Hanumakonda", "Jagtial", "Jangaon", "Jayashankar Bhupalpally",
                                  "Jogulamba Gadwal", "Kamareddy", "Komaram Bheem Asifabad", "Mahabubabad", "Mancherial",
                                  "Medchal–Malkajgiri", "Mulugu", "Nagarkurnool", "Narayanpet", "Nirmal", "Peddapalli",
                                  "Rajanna Sircilla", "Sangareddy", "Siddipet", "Suryapet", "Vikarabad", "Wanaparthy", "Yadadri Bhuvanagiri"]
      telangana_district_names.each do |telangana_district_name|
        district_bhadradri_kothagudem = District.where(name: telangana_district_name).first_or_create!
        district_bhadradri_kothagudem.update(state_id: state_telangana.id)
      end
    end

    state_ladakh = State.find_by(name: "Ladakh")
    if state_ladakh.present?
      ladakh_districts_names = ["Leh", "Kargil"]
      ladakh_districts_names.each do |ladakh_districts_name|
        district_leh = District.where(name: ladakh_districts_name).first_or_create!
        district_leh.update(state_id: state_ladakh.id)
      end
    end

    state_chhattisgarh = State.where(name: "Chhattisgarh").first
    state_maharashtra = State.where(name: "Maharashtra").first
    state_telangana = State.where(name: "Telangana").first

    District.where(name: ["Bastar", "Dhamtari", "Durg", "Jashpur", "Janjgir-Champa", "Korba", "Koriya", "Kanker", "Kawardha", "Mahasamund", "Raigarh", "Rajnandgaon", "Raipur", "Surguja"]).update_all(state_id: state_chhattisgarh.id)

    District.where(name: ["Aurangabad"]).update_all(state_id: state_maharashtra.id)

    District.where(name: ["Adilabad", "Khammam", "Mahbubnagar", "Medak", "Nalgonda", "Nizamabad", "Rangareddi", "Warangal", "Karimnagar", "Hyderabad"]).update_all(state_id: state_telangana.id)
  end
end
