const names = ["Роман", "Валентин","марія","Іван",]
const nameLengths = names.reduce((acc, name) => {
	acc[name] = name.length;
	return acc;
}, {});
console.log("Обєм з довжинами імен",nameLengths);
const nameLengthsALT = {};
nemes.forEach(name=>{
   nameLengthsALT[name]=
name.length;
});
console.log ("Альтеративний об'єкт", nameLengthsAlt);
const nameLengthsEntries =
Object.frameEntries(
    name.map(name=> [name,name.length]) 
);
console.log ("Об'єкт через Object.frameEntries:", nameLengthsEntries);