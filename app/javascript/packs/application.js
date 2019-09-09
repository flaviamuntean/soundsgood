import "bootstrap";

import {initGeoLocation} from "components/location.js";
import {submitAll} from "../components/modal.js";
import {addPhoto} from "../components/photo.js";
import {myFunction} from"../components/profile-navbar.js";
import {toggleIcons} from "../components/profile_fav.js";

initGeoLocation();
addPhoto();
submitAll();
myFunction();
toggleIcons();

