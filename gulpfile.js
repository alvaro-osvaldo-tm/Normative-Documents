const gulp = require('gulp');
const watch = require('gulp-watch');
const shell = require('shelljs'); // Import shelljs for shell command execution

/**
 * Return the current time
 * @returns string Formated current time
 */
function now() { 
  const date = new Date();
  
  const seconds = parseInt(date.getSeconds()).toString().padStart(2,0)
  const minutes = parseInt(date.getMinutes()).toString().padStart(2,0)

  return (`${date.getHours()}:${minutes}:${seconds}`)
}

gulp.task('watch', () => {


  return [

    /**
   * Monitor and execute any Shell script in 'Operations' or 
   * 'Parameters' directory changes
   */

    watch(
      [
        "Operations/**/*.sh",
        "Parameters/requirements/*.sh",
      ], (file) => {


        let handler = require('path');
        const path = handler
          .normalize(file.path)
          .replaceAll(' ', '\\ ');

        let parameters = ""

        console.clear();

        console.log(`[${now()}] Running: '${path}'`)

        const code = shell.exec(`${path} ${parameters}`).code;

        console.debug(`[${now()}] Finshed with '${code}'.`);


      }),

      /**
       * Monitor changes in environment files
       */

      watch([
        'Parameters/environment/**/*',
        '.env.custom'
      ], (file) => {

          console.log(`[${now()}] Updating environment file.`)

          const code = shell.exec(`Operations/Parameters/create.sh`).code;

          console.debug(`[${now()}] Finshed with '${code}'.`);
      } )
  ];

});

gulp.task('default', gulp.series('watch')); 
