<?php
require_once 'includes/functions.php';

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $password = trim($_POST['password'] ?? '');

    if (!empty($username) && !empty($password)) {
        $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ? AND status = 'active' LIMIT 1");
        $stmt->execute([$username]);
        $user = $stmt->fetch();

        if ($user && password_verify($password, $user['password'])) {
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['role']    = $user['role'];
            $_SESSION['name']    = $user['full_name'] ?? ($user['name'] ?? 'User');
            $_SESSION['profile_image'] = $user['profile_image'] ?? '';

            if (strtolower($user['role']) === 'instructor') {
                redirect('instructor/dashboard.php');
            } elseif (strtolower($user['role']) === 'monitor') {
                redirect('monitor/dashboard.php'); 
            } else {
                redirect('admin/dashboard.php'); 
            }
        } else {
            $stmt = $pdo->prepare("
                SELECT m.*, s.name, s.image 
                FROM monitors m 
                JOIN students s ON m.student_id = s.student_id 
                WHERE m.monitor_username = ? AND m.status = 'active' 
                LIMIT 1
            ");
            $stmt->execute([$username]);
            $monitor = $stmt->fetch();

            if ($monitor && password_verify($password, $monitor['monitor_password'])) {
                $_SESSION['user_id'] = $monitor['id'];
                $_SESSION['role']    = 'monitor';
                $_SESSION['name']    = $monitor['name'];
                $_SESSION['profile_image'] = $monitor['image'] ?? '';

                redirect('monitor/dashboard.php');
            } else {
                $error = 'පරිශීලක නාමය හෝ මුරපදය වැරදි වේ!';
            }
        }
    } else {
        $error = 'කරුණාකර සියලුම කොටස් පුරවන්න!';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - ECHEM Student Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/theme.css">
    <style>
        body {
            background: linear-gradient(135deg, #fdfbf7 0%, #eef2f5 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .login-card {
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(212, 175, 55, 0.15), 0 5px 15px rgba(0, 0, 0, 0.05);
            background: #ffffff;
            width: 100%;
            max-width: 440px;
            border-top: 5px solid #d4af37;
        }
        .login-header {
            background-color: #ffffff;
            padding: 35px 25px 15px 25px;
            text-align: center;
        }
        .login-header h2 {
            color: #d4af37;
            font-weight: 800;
            letter-spacing: 2px;
            margin-bottom: 2px;
            font-size: 2rem;
        }
        .login-header p {
            color: #777;
            font-size: 0.78rem;
            font-weight: 700;
            letter-spacing: 1.5px;
            margin-bottom: 12px;
        }
        .badge-nvq {
            background-color: #fff9e6;
            color: #b8860b;
            border: 1px solid #e6c656;
            font-weight: 600;
            padding: 6px 14px;
            border-radius: 50px;
            font-size: 0.75rem;
        }
        .btn-gold {
            background: linear-gradient(135deg, #e6c656 0%, #b8860b 100%);
            border: none;
            color: #ffffff;
            font-weight: 700;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }
        .btn-gold:hover {
            background: linear-gradient(135deg, #b8860b 0%, #8b6508 100%);
            box-shadow: 0 6px 18px rgba(184, 134, 11, 0.3);
            color: #ffffff;
            transform: translateY(-1px);
        }
        .form-control:focus {
            border-color: #d4af37;
            box-shadow: 0 0 0 0.25rem rgba(212, 175, 55, 0.2);
        }
        .input-group-text {
            background-color: #f8f9fa;
            border-right: none;
            color: #b8860b;
        }
        .input-group .form-control {
            border-left: none;
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center px-3">
    <div class="login-card">
        <div class="login-header">
            <h2>ECHEM</h2>
            <p>EMPOWERING FUTURE INNOVATORS</p>
            <span class="badge badge-nvq"><i class="bi bi-award-fill me-1"></i> NVQ ACCREDITED CENTER</span>
        </div>
        
        <div class="card-body p-4 pt-2">
            
            <?php if (!empty($error)): ?>
                <div class="alert alert-danger alert-dismissible fade show text-center py-2" role="alert">
                    <small><i class="bi bi-exclamation-triangle-fill me-1"></i> <?= htmlspecialchars($error) ?></small>
                    <button type="button" class="btn-close py-2" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <?php endif; ?>

            <form method="POST" action="login.php">
                <div class="mb-3">
                    <label class="form-label fw-semibold text-secondary small">Username</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                        <input type="text" name="username" class="form-control" placeholder="Enter username" required autofocus>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label fw-semibold text-secondary small">Password</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                        <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                    </div>
                </div>

                <button type="submit" class="btn btn-gold w-100 py-2 rounded-3 mb-2">
                    <i class="bi bi-box-arrow-in-right me-1"></i> Sign In
                </button>
            </form>

        </div>
        <div class="card-footer bg-white text-center py-3 border-0">
            <small class="text-muted" style="font-size: 0.75rem;">&copy; <?= date('Y') ?> ECHEM Institute of Vocational & Technical Education</small>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>