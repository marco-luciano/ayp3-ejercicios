from datetime import datetime

class ExpirationTimer:
    def __init__(self, minutes_for_expiration):
        self._last_updated_time = datetime.now()
        self._expiration_time_in_minutes = minutes_for_expiration
    
    def has_expired(self):
        difference_in_minutes = (datetime.now() - self._last_updated_time).total_seconds() / 60
        if difference_in_minutes >= self._expiration_time_in_minutes:
            return True
        else:
            return False

    def reset_time(self):
        self._last_updated_time = datetime.now()