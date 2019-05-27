import { initSelect2 } from './initSelect2';
import { initMapbox } from './initMapbox';
import 'mapbox-gl/dist/mapbox-gl.css';
import flatpickr from "flatpickr";



initSelect2();
initMapbox();
flatpickr("#playground-date", {enableTime: true, minuteIncrement: 15});

