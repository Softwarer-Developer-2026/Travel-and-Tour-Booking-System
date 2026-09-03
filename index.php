<?php
require_once 'includes/db_connect.php';
require_once 'includes/functions.php';

// Check logged in users and redirect to respective dashboards
if (isLoggedIn()) {
    if (isAdmin()) redirect('admin/dashboard.php');
    if (isInstructor()) redirect('instructor/dashboard.php');
    if (isMonitor()) redirect('monitor/dashboard.php');
} else {
    redirect('login.php');
}
?>