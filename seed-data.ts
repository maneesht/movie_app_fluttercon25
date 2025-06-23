import { initializeApp } from 'firebase-admin/app';
import { getDataConnect } from 'firebase-admin/data-connect';
import * as movieJson from './lib/static/movies.json';

initializeApp();
const dataConnect = getDataConnect({ location: 'us-central1', serviceId: 'movieappfluttercon25' });

interface Movie {
  title: string;
  id: string;
  genre: string;
  imageUrl: string;
  description: string;
  releaseYear: number;
  rating: number;
}


console.log(movieJson.movies);
async function seedData() {
    await dataConnect.insertMany<Movie[], Movie[]>('movie', movieJson.movies);
}
seedData();