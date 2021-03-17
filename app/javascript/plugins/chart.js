const chart =() => {
  var ctx = document.getElementById('myChart');
  const previousWeek = document.querySelector('.previous_week').dataset;
  const actualWeek = document.querySelector('.actual_week').dataset;
  const target = document.querySelector('#target');
  console.log(previousWeek)

  // get the current number week
  // Date.prototype.getWeekNumber = function(){
  // var d = new Date(Date.UTC(this.getFullYear(), this.getMonth(), this.getDate()));
  // var dayNum = d.getUTCDay() || 7;
  // d.setUTCDate(d.getUTCDate() + 4 - dayNum);
  // var yearStart = new Date(Date.UTC(d.getUTCFullYear(),0,1));
  // return Math.ceil((((d - yearStart) / 86400000) + 1)/7)
  // };

  // const week = new Date().getWeekNumber();
  // console.log(week);

  if (ctx) {
          ctx.getContext('2d')
          var chart = new Chart(ctx, {
          // The type of chart we want to create
          type: 'bar',

          // The data for our dataset
          data: {
              labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
              datasets: [
              {
                  label: `Week ${previousWeek.week}`,
                  backgroundColor: '#80BC46',
                  data: [previousWeek.mondayOrders, previousWeek.tuesdayOrders, previousWeek.wednesdayOrders, previousWeek.thursdayOrders, previousWeek.fridayOrders, previousWeek.saturdayOrders, previousWeek.sundayOrders]
              },
              {
                  label: `Week ${actualWeek.week}`,
                  backgroundColor: '#4B9EB9',

                  data: [actualWeek.mondayOrders, actualWeek.tuesdayOrders, actualWeek.wednesdayOrders, actualWeek.thursdayOrders, actualWeek.fridayOrders, actualWeek.saturdayOrders, actualWeek.sundayOrders],
                  type: 'bar'
              }
              ]
          },

          // Configuration options go here
          options: {
            legend: {
              position: 'right'
            }
          }
      });
  }


}

export { chart };
