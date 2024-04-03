module m_status
    implicit none

    integer :: health

    contains
    subroutine printStatus
        print *, "Health: ", health
    end subroutine printStatus
end module m_status