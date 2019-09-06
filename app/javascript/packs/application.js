import "bootstrap";

import {initGeoLocation} from "components/location.js";
import {submitAll} from "../components/modal.js";
import {addPhoto} from "../components/photo.js";
import {myFunction} from"../components/profile-navbar.js";
initGeoLocation();
addPhoto();
submitAll();
myFunction();
