#!/bin/bash

## _______________________________________________________________________________________________ ARGS
sh_args=$#


## ___________________________________________________________________________ SETS

## ---- PROGRAMA
sh_nombre=${BASH_SOURCE##*/}		## Nombre SH
sh_vsh="2024.0227"					## Version BASH
sh_pwd=`pwd`						## Ruta Actual

sh_ruta="/apps/dk_duplicacy"
dk_compose=`whereis docker-compose | awk {'print $2'}`


## ___________________________________________________________________________ FUNCTIONS

## ----------------------------------------------------------------- F# PANDORA PARAR PROCESOS
function start_dk_compose()
{

	cd $sh_ruta
	echo "- Lanzando Docker"
	$dk_compose up -d
}

## ----------------------------------------------------------------- F# PANDORA PARAR PROCESOS
function stop_dk_compose()
{

	cd $sh_ruta
	echo "- Parando Docker"
	$dk_compose stop
}

## ----------------------------------------------------------------- F# MAIN
function main()
{

	start_dk_compose	
	
}

## ----------------------------------------------------------------- F# MAIN_ARGS
function main_args()
{

	case $1 in
		
		##____________________________________ START
		start)
			start_dk_compose
		;;
		
		##____________________________________ STOP
		stop)
			stop_dk_compose
		;;
		
		##____________________________________ STOP
		restart)
			stop_dk_compose
			sleep 2
			start_dk_compose
		;;
		
		##____________________________________ *
		*)
			main_help
		;;
	esac
}

  # build              Build or rebuild services
  # config             Validate and view the Compose file
  # create             Create services
  # down               Stop and remove resources
  # events             Receive real time events from containers
  # exec               Execute a command in a running container
  # help               Get help on a command
  # images             List images
  # kill               Kill containers
  # logs               View output from containers
  # pause              Pause services
  # port               Print the public port for a port binding
  # ps                 List containers
  # pull               Pull service images
  # push               Push service images
  # restart            Restart services
  # rm                 Remove stopped containers
  # run                Run a one-off command
  # scale              Set number of containers for a service
  # start              Start services
  # stop               Stop services
  # top                Display the running processes
  # unpause            Unpause services
  # up                 Create and start containers
  # version            Show version information and quit


cd $sh_ruta

	## -------- Argumentos
	if [ $sh_args -eq 0 ]; then

		main
		
	else

		main_args $@
		
	fi

cd $sh_pwd

# conlor -1
## ___________________________________________________________________________ FIN

