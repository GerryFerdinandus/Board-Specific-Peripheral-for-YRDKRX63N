/*
  Call some driver routine.
*/

#include "platform.h"

int main(void);

int main(void)
{
    /* Initialize LCD */
    lcd_initialize();

    /* Clear LCD */
    lcd_clear();

    /* Display message on LCD */
    lcd_display(LCD_LINE1, "  RENESAS   ");
    lcd_display(LCD_LINE2, " YRDKRX63N  ");

    for(;;)
    {
        //empty loop
    }
    return 0;
}
