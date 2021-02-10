import unittest
from datetime import datetime, timedelta
from expiration_timer import ExpirationTimer

class TestExpirationTimer(unittest.TestCase):
    def test00_timer_valid_at_start(self):
        testing_expiration_time = 30
        testing_timer = ExpirationTimer(testing_expiration_time)

        self.assertEqual(False, testing_timer.has_expired())
    
    def test01_timer_should_expire_after_specified_time(self):
        testing_expiration_time = 30
        testing_timer =ExpirationTimer(testing_expiration_time)

        testing_timer._last_updated_time = datetime.now() - timedelta(minutes = 30) 
        self.assertEqual(True, testing_timer.has_expired())

    def test02_timer_reset_last_updated_time(self):
        testing_expiration_time = 30
        testing_timer =ExpirationTimer(testing_expiration_time)

        testing_timer._last_updated_time = datetime.now() - timedelta(minutes = 30)
        self.assertEqual(True, testing_timer.has_expired())
        
        testing_timer.reset_time()
        self.assertEqual(False, testing_timer.has_expired())


if __name__ == '__main__':
    unittest.main()