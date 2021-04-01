var simplemaps_countrymap_mapdata={
  main_settings: {
    //General settings
		width: "300", //or 'responsive'
    background_color: "#FFFFFF",
    background_transparent: "yes",
    border_color: "#ffffff",
    pop_ups: "detect",
    
		//State defaults
		state_description: "State description",
    state_color: "#88A4BC",
    state_hover_color: "#3B729F",
    state_url: "",
    border_size: 1.5,
    all_states_inactive: "no",
    all_states_zoomable: "no",
    
		//Location defaults
		location_description: "Location description",
    location_url: "",
    location_color: "#FF0067",
    location_opacity: 0.8,
    location_hover_opacity: 1,
    location_size: 25,
    location_type: "square",
    location_image_source: "frog.png",
    location_border_color: "#FFFFFF",
    location_border: 2,
    location_hover_border: 2.5,
    all_locations_inactive: "no",
    all_locations_hidden: "no",
    
		//Label defaults
		label_color: "#d5ddec",
    label_hover_color: "#d5ddec",
    label_size: 22,
    label_font: "Arial",
    hide_labels: "no",
    hide_eastern_labels: "no",
   
		//Zoom settings
		zoom: "no",
    manual_zoom: "no",
    back_image: "no",
    initial_back: "no",
    initial_zoom: "-1",
    initial_zoom_solo: "no",
    region_opacity: 1,
    region_hover_opacity: 0.6,
    zoom_out_incrementally: "yes",
    zoom_percentage: 0.99,
    zoom_time: 0.5,

		//Popup settings
		popup_color: "white",
    popup_opacity: 0.9,
    popup_shadow: 1,
    popup_corners: 5,
    popup_font: "12px/1.5 Verdana, Arial, Helvetica, sans-serif",
    popup_nocss: "no",
    
		//Advanced settings
		div: "map",
    auto_load: "yes",
    url_new_tab: "no",
    images_directory: "default",
    fade_time: 0.1,
    link_text: "View Website"
  },
  state_specific: {
    // GHA2155: {
    //   name: "Northern",
    //   hover_color: "#4482ff",
    //   color: "#565656",
    //   description: "Anti Human Trafficking Unit <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><br><br>Pocodep <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><br><br>Caritas <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a>"
    // },
    // GHA2156: {
    //   name: "Upper East",
    //   color: "#6c6c6c",
    //   hover_color: "#4482ff",
    //   description: "Anti Human Trafficking Unit <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><br><br>Pocodep <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><br><br>Caritas <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a>"
    // },
    // GHA2157: {
    //   name: "Upper West",
    //   color: "#a8a8a8",
    //   hover_color: "#4482ff",
    //   description: "Anti Human Trafficking Unit <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><br><br>Pocodep <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><br><br>Caritas <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a>"
    // },
    GHA2158: {
      name: " ",
      color: "#a8a8a8",
      hover_color: "#4482ff",
      description: "<a href=\"ashanti-region.html\"><b>Ashanti</b></a> <br> Social Support Foundation (SSF) <br> Based in Obuasi <br> <a href=\"tel:\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 605 165</i></a><a href=\"\" target=\"_blank\" style=\"margin-left:10px;\">director@ssfghana.org</a>"
    },
    // GHA2159: {
    //   name: "Brong Ahafo",
    //   hover_color: "#4482ff",
    //   color: "#6c6c6c",
    //   description: "Anti Human Trafficking Unit <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><br><br>Pocodep <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><br><br>Caritas <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a>"
    // },
    // GHA2160: {
    //   name: "Central",
    //   color: "#a8a8a8",
    //   hover_color: "#4482ff",
    //   description: "Anti Human Trafficking Unit <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><br><br>Pocodep <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><br><br>Caritas <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a>"
    // },
    // GHA2161: {
    //   name: "Eastern",
    //   color: "#6c6c6c",
    //   hover_color: "#4482ff",
    //   description: "Anti Human Trafficking Unit <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><br><br>Pocodep <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><br><br>Caritas <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a>"
    // },
    // GHA2162: {
    //   name: "Western",
    //   color: "#6c6c6c",
    //   hover_color: "#4482ff",
    //   description: "Anti Human Trafficking Unit <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><br><br>Pocodep <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><br><br>Caritas <br><a href=\"tel:024200005551\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a>"
    // },
    GHA2172: {
      name: " ",
      color: "#6c6c6c",
      hover_color: "#4482ff",
      description: "<a href=\"greater-accra.html\"><b>Greater Accra</b></a> <br> <span style=\"border-bottom:1px solid #ddd;color:#000;font-size:13px;margin-bottom:6px;font-weight:600;\">Legal Resource Centre</span> Legal assistance <br> Contact: Robert Nomo jnr <br> <a href=\"tel:\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 024 20 000 5551</i></a><a href=\"\" target=\"_blank\" style=\"margin-left:7px;\">info@lrcghana.org</a>  <span style=\"border-bottom:1px solid #ddd;color:#000;font-size:13px;margin-bottom:6px;font-weight:600;margin-top:6px;\">International Justice Mission </span> Rescue of victims of human trafficking <br><a href=\"tel:\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 0302 543 793</i></a><a href=\"\" target=\"_blank\" style=\"margin-left:7px;\">ezuta@ijm.org</a> <span style=\"border-bottom:1px solid #ddd;color:#000;font-size:13px;margin-bottom:6px;font-weight:600;margin-top:6px;\">Village of Hope </span> Assistance with getting the police involved <br> Contact: Fred Asare <br> <a href=\"tel:\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 0244 313 404</i></a><a href=\"\" target=\"_blank\" style=\"margin-left:7px;\">info@thevillageofhope.com</a><br><p style=\"font-size:13px;\">Further details: <a href=\"www.thevohgroup.com \" target=\"_blank\" style=\"margin-left:7px;\"> www.thevohgroup.com </a></p>  <span style=\"border-bottom:1px solid #ddd;color:#000;font-size:13px;margin-bottom:6px;font-weight:600;margin-top:6px;\">International Needs Ghana  </span> Rescue of victims of human trafficking <br> Based in Odokor <br> <a href=\"tel:\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 233(0)302 300 224</i></a><a href=\"\" target=\"_blank\">info@internationalneedsgh.com</a>"
    },
    GHA2173: {
      name: " ",
      color: "#a8a8a8",
      hover_color: "#4482ff",
      description: "<a href=\"volta-region.html\"><b>Volta</b></a><br> <span style=\"border-bottom:1px solid #ddd;color:#000;font-size:13px;margin-bottom:6px;font-weight:600;\">Partners in Community Development (PACODEP)</span> Rescue and shelter of victims of human trafficking <br> Based in Kete-Krachi <br> <a href=\"tel:\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 0242 202 629</i></a><a href=\"\" target=\"_blank\" style=\"margin-left:7px;\">pacodepgh@yahoo.com</a> <p style=\"font-size:13px;\">Further details: <a href=\"http://www.pacodep.ngo/\" target=\"_blank\" style=\"margin-left:3px;\"> http://www.pacodep.ngo/ </a></p> <span style=\"border-bottom:1px solid #ddd;color:#000;font-size:13px;margin-bottom:6px;font-weight:600;margin-top:7px;\">International Needs Ghana </span> Rescue of victims of human trafficking <br> Based in Odokor <br> <a href=\"tel:\" target=\"_blank\"><i class=\"fas fa-phone-alt\" style=\"color: #000\"> &nbsp; 233(0)302 300 224</i></a><a href=\"\" target=\"_blank\" >info@internationalneedsgh.com</a> "
    }
  },
  locations: {
    "0": {
      lat: "5.554828",
      lng: "-0.200086",
      name: "Accra"
    }
  },
  labels: {
    "0": {
      name: "Test",
      parent_type: "state"
    },
    "1": {
      name: "Northern",
      parent_id: "GHA2155",
      x: 568.9,
      y: 380.6
    },
    "2": {
      name: "Upper East",
      parent_id: "GHA2156",
      x: 459.9,
      y: 98.5
    },
    "3": {
      name: "Upper West",
      parent_id: "GHA2157",
      x: 242.6,
      y: 170.4
    },
    "4": {
      name: "Ashanti",
      parent_id: "GHA2158",
      x: 376.6,
      y: 1022.4
    },
    "5": {
      name: "Brong Ahafo",
      parent_id: "GHA2159",
      x: 159.1,
      y: 870.9
    },
    "6": {
      name: "Central",
      parent_id: "GHA2160",
      x: 465.6,
      y: 1290.5
    },
    "7": {
      name: "Eastern",
      parent_id: "GHA2161",
      x: 634.2,
      y: 1097.9
    },
    "8": {
      name: "Western",
      parent_id: "GHA2162",
      x: 229.6,
      y: 1309.9
    },
    "9": {
      name: "Greater Accra",
      parent_id: "GHA2172",
      x: 744.6,
      y: 1212.2
    },
    "10": {
      name: "Volta",
      parent_id: "GHA2173",
      x: 792.4,
      y: 736.9
    }
  },
  regions: {
    "0": {
      states: [],
      name: "Test",
      color: "blue",
      hover_color: "black",
      description: "testing the map"
    }
  }
};