import "bootstrap";

import {initGeoLocation} from "components/location.js";
import {submitAll} from "../components/modal.js";
import {addPhoto} from "../components/photo.js";
import {initUpdateNavbarOnScroll} from"../components/profile-navbar.js";
import {toggleIcons} from "../components/profile_fav.js";
import '../components/notifications.js';


initGeoLocation();
addPhoto();
submitAll();
toggleIcons();
initUpdateNavbarOnScroll();

const messagesIndex = document.querySelector(".messages.index");
