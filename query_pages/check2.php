<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="alien.ico" />
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <title>Aliens</title>
</head>
<body>
<header class="p-3 text-bg-dark">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
        <li><a href="check1.php" class="btn btn-outline-light me-2">1</a></li>
          <li><a href="check2.php" class="btn btn-outline-light me-2">2</a></li>
          <li><a href="check3.php" class="btn btn-outline-light me-2">3</a></li>
          <li><a href="check4.php" class="btn btn-outline-light me-2">4</a></li>
          <li><a href="check5.php" class="btn btn-outline-light me-2">5</a></li>
          <li><a href="check6.php" class="btn btn-outline-light me-2">6</a></li>
          <li><a href="check7.php" class="btn btn-outline-light me-2">7</a></li>
          <li><a href="check8.php" class="btn btn-outline-light me-2">8</a></li>
          <li><a href="check9.php" class="btn btn-outline-light me-2">9</a></li>
          <li><a href="check10.php" class="btn btn-outline-light me-2">10</a></li>
          <li><a href="check11.php" class="btn btn-outline-light me-2">11</a></li>
          <li><a href="check12.php" class="btn btn-outline-light me-2">12</a></li>
        </ul>

        <div class="text-end">
          
          <a href="check.php" class="btn btn-outline-light me-2">Home</a>
          <a href="index.php" class="btn btn-warning me-2">DATA</a>        </div>
      </div>
    </div>
  </header>
  <div>
<br/>
<body class="text-bg-secondary">
<h4 class="d-flex justify-content-center">Для людини H знайти усi кораблi, де вона побувала за вказаний перiод (з дати F по дату
T)</h4>
<form class="d-flex justify-content-center" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
  <div class="form-row">
    <div class="col">
    <!-- Атрибут name у php буде $_POST['alien'] і т.д. -->
      <input type="text" class="form-control" name="alien" placeholder="Enter Human...">
    </div>
    <div class="col">
    <div class="input-group date" id="datepicker" name="date">
                        <input type="text" class="form-control">
                        <input type="hidden" id="datepickerhidden" name="datepickerhidden" value="">
                        <span class="input-group-append">
                            <span class="input-group-text bg-white">
                                <i class="fa fa-calendar"></i>
                            </span>
                        </span>
                    </div>
                </div>
    <div class="col">
    <div class="input-group date" id="datepicker2" name="date2">
                        <input type="text" class="form-control">
                        <input type="hidden" id="datepickerhidden2" name="datepickerhidden2" value="">
                        <span class="input-group-append">
                            <span class="input-group-text bg-white">
                                <i class="fa fa-calendar"></i>
                            </span>
                        </span>
                    </div>
                </div>
    <div class="col">
    <button type="submit" class="btn btn-warning">Submit</button>
    </div>
  </div>
</form>
<br/>
<table class="table table-bordered bg-secondary">
  <thead>
    <tr>
      <th scope="col">Vin</th>
      <th scope="col">Make</th>
      <th scope="col">Model</th>
      <th scope="col">Capacity</th>
    </tr>
  </thead>
  <tbody>
  <?php
  $alien = " ";
  	if (!empty($_POST)){
  		$alien = htmlspecialchars($_POST["alien"]);
  		$date = ($_POST["datepickerhidden"]);
  		$date2 = ($_POST["datepickerhidden2"]);
  		$date = str_replace("/",".", $date);
      $date2 = str_replace("/",".", $date2);
  		//echo "{$alien} - {$n_num} - {$date} - {$date2}"; 

  		// Робим запит на збереження ...
  		
  		
  		// Перезагружаєм сторінку аби підтянулись нові дані в таблицю
  		
  		
  	}
        $myPDO = pg_connect("host=localhost port=5432 dbname=aliens_backup user=postgres password=233009");
        $sql = " ";
        if($alien != " ")
        {
          $sql = "SELECT distinct spaceship.*
          from spaceship
          inner join alien_spaceship
            on spaceship.vin = alien_spaceship.spaceship_vin
          inner join alien
            on alien.isn = alien_spaceship.isn
          inner join human_kidnapped_alien
            on human_kidnapped_alien.alien_isn = alien.isn
          where human_kidnapped_alien.human_passport= '$alien'
          and (human_kidnapped_alien.kidnapping_date > '$date' and human_kidnapped_alien.kidnapping_date <'$date2')
          union
          select distinct spaceship.*
          from spaceship
          inner join experiment
            on spaceship.vin = experiment.spaceship_vin
          where experiment.kidnapped_human_passport = '$alien'
          and (experiment.experiment_date > '$date' and experiment.experiment_date <'$date2');";
        }
        
        if ($myPDO && $sql != " ") {
            $result = pg_query($myPDO, $sql);
            $res = '';
            while ($row = pg_fetch_row($result)) {
                $res .= '<tr>';

                $res .= '<td>' .$row[0] . '</td>';
                $res .= '<td>' .$row[1] . '</td>';
                $res .= '<td>' .$row[2] . '</td>';
                $res .= '<td>' .$row[3] . '</td>';

                $res .= '</tr>';
            }
            echo $res;
        } 
        ?>
  </tbody>
</table>
<div id="placeholder"></div>
<script type="text/javascript">
        $(function() {
          $('#datepicker').datepicker().on('changeDate', function(e) {
    $('#datepickerhidden').val(e.format(0,"dd.mm.yyyy"))
});
$('#datepicker2').datepicker().on('changeDate', function(e) {
    $('#datepickerhidden2').val(e.format(0,"dd.mm.yyyy"))
});
        });
    </script>
</body>
</html>
