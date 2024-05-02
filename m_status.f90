 ! MIT License
 ! 
 ! Copyright (c) 2024 Joshua Horvath
 ! 
 ! Permission is hereby granted, free of charge, to any person obtaining a copy
 ! of this software and associated documentation files (the "Software"), to deal
 ! in the Software without restriction, including without limitation the rights
 ! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 ! copies of the Software, and to permit persons to whom the Software is
 ! furnished to do so, subject to the following conditions:
 ! 
 ! The above copyright notice and this permission notice shall be included in all
 ! copies or substantial portions of the Software.
 ! 
 ! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 ! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 ! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 ! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 ! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 ! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 ! SOFTWARE.

module m_status
    implicit none

    ! user input variables 
    character(len=1) :: response
    integer :: io_status

    ! game play status variables 
    integer :: health
    logical :: foundAtticKey
    logical :: foundBaseballBat
    logical :: foundSafeCombination
    logical :: usedFirstAidKit

    ! random number variables
    real :: r
    integer :: randomNumber

    contains
    ! prints out status information
    subroutine printStatus
        print *, "Health: ", health
        print *, "Found Attic Key: ", foundAtticKey
        print *, "Found Baseball Bat: ", foundBaseballBat
        print *, "Found combination for safe: ", foundSafeCombination
        print *, "Used first aid kit: ", usedFirstAidKit
    end subroutine printStatus

    ! offer user a choice to stop the game 
    subroutine quitProgram
        print *, "Are you sure you want to quit the game? Y/N"
        read(*, *) response
        if (response == 'y' .or. response == 'Y') then
            print *, "You have choosen to leave the house. &
                &That's probably the safest thing to do anyway. Goodbye."
            stop ! shut down the program
        end if
    end subroutine quitProgram

    ! updates value of global randomNumber variable
    subroutine getRandomeNumber
        call random_seed()
        call random_number(r)
        r = r * 10.0
        randomNumber = int(r)
    end subroutine getRandomeNumber

    ! determines if there is a monsert attack and what the attack should be
    subroutine monsterAttack
        call getRandomeNumber()

        if (randomNumber == 5) then 
            call getRandomeNumber()

            if (randomNumber >= 5) then
                call tarantulaAttack()
            else 
                call ghostAttack()
            end if

            if (health < 1) then 
                print *, "You did not survive your encounter with the scary house, better luck next time."
                print *, "GAME OVER"
                stop
            end if
        end if
    end subroutine monsterAttack

    ! player is attacked by a tarantula
    subroutine tarantulaAttack 
        print *, "You just standing when you realize a tarantula is on your leg."

        do 
            print *, "Make selection: G) Try to gently remove tarantula K) Kick off the tarantula Q) Quit game"
            read(*, *, iostat=io_status) response
    
            select case (response)

            case ('g', 'G') 
                print *, "You gently try to remove the tarantula from your leg."
                call getRandomeNumber()
                if (randomNumber < 3) then
                    ! player was unlucky, takes higher damage
                    print *, "As you are trying to carefully remove the tarantula bites your leg and runs off."
                    health = health - 10
                    print *, "Health: ", health
                else 
                    print *, "You successfully remove the tarantula without getting hurt."
                end if 
                exit

            case ('k', 'K') 
                print *, "You forcefully try to kick the tarantula off your leg."
                call getRandomeNumber()

                if (randomNumber < 3) then
                    print *, "You forcfully kick the tarantula off your leg, but you fall over onto the floor &
                    &and hurt yourself as you land."
                    health = health - 5
                    print *, "Health: ", health
                else 
                    print *, "You kick the tarantula off your leg, but you fall over onto the floor and hurt your hand as you land."
                    health = health - 3
                    print *, "Health: ", health
                end if
                exit

            case ('q', 'Q')
                call quitProgram()
    
            case default
                print*, "Invalid selection, try again." 
            end select
        end do

    end subroutine tarantulaAttack

    ! player has an encounter with a ghost
    subroutine ghostAttack
        print *, "You feel cold, and the hairs on the back of your neck stand up."
        print *, "You turn your head and see a woman standing next to you."
        print *, "Her feet do not touch the floor. Actually as you look, you notice that she doesn't have feet."

        do 
            print *, "Make selection: S) Say hello R) Run away Q) Quit game"
            read(*, *, iostat=io_status) response
    
            select case (response)

            case ('s', 'S') 
                print *, "You say hello to the ghost."
                call getRandomeNumber()
                print *, "The ghost opens her mouth as if to start saying something back to you.."
                if (randomNumber < 3) then
                    print *, "the ghost lets out a scream that makes you fall over onto the floor."
                    print *, "The face on the ghost looks angry, and not at all like it did before."
                    print *, "You black out..."
                    print *, "Press Enter key..."
                    read(*, *)
                    print *, "When you wake up, the ghost is gone and you hurt all over."
                    health = health - 5
                    print *, "Health: ", health
                else 
                    print *, "but, suddenly the ghost just isn't there anymore."
                end if
                exit 

            case ('r', 'R') 
                print *, "You turn and try to run from the ghost."
                call getRandomeNumber()
                if (randomNumber < 3) then
                    print *, "You stumble as you start to run, but then notice you are alone again in the room."
                else 
                    print *, "The ghost chases you."
                    print *, "The ghost reaches it's arm to you. As it touches you feel a freezing cold."
                    print *, "You fall down and get hurt."
                    health = health - 5
                    print *, "Health: ", health
                    print *, "You look around and notice you are alone again."
                end if
                exit

            case ('q', 'Q')
                call quitProgram()
    
            case default
                print*, "Invalid selection, try again." 
            end select
        end do

    end subroutine ghostAttack
end module m_status