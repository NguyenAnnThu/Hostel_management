<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="topbar">
    <div class="topbar-left">
        <div class="topbar-greeting">Chào mừng, Chủ trọ</div>
        <div class="topbar-search">
            <i class="bi bi-search"></i>
            <input type="text" placeholder="Tìm kiếm...">
        </div>
    </div>
    <div class="topbar-right">
        <div class="profile-dropdown">
            <button class="profile-btn" onclick="toggleProfileMenu()">
                <div class="profile-avatar">CT</div>
                <span>Chủ trọ</span>
                <i class="bi bi-chevron-down"></i>
            </button>
            <div class="dropdown-menu-custom" id="profileMenu">
                <div class="dropdown-item-custom">Hồ sơ cá nhân</div>
                <div class="dropdown-item-custom">Cài đặt</div>
                <div class="dropdown-item-custom" onclick="logout()">Đăng xuất</div>
            </div>
        </div>
    </div>
</div>

<script>
    function toggleProfileMenu() {
        document.getElementById('profileMenu').classList.toggle('show');
    }
    function logout() {
        window.location.href = '${pageContext.request.contextPath}/view/owner/login.jsp';
    }
    document.addEventListener('click', function(e) {
        const menu = document.getElementById('profileMenu');
        const btn = document.querySelector('.profile-btn');
        if (menu && btn && !menu.contains(e.target) && !btn.contains(e.target)) {
            menu.classList.remove('show');
        }
    });
</script>