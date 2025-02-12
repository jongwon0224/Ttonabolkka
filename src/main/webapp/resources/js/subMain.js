// 하트 토글 기능
function toggleHeart(icon) {
    console.log('클릭완료');
    icon.classList.toggle("active");
}

function filterAction(button, categoryId) {

    let currentPage = document.getElementById('currentPage').value || 1;
    let pageSize = document.getElementById('pageSize').value;

    let categoryBtn = document.getElementsByClassName('category-filter');

    for(let i=0; i<categoryBtn.length; i++) {
        categoryBtn[i].classList.remove('selected');
    }

    button.classList.add('selected');

    console.log(`필터액션: 카테고리 ID - ${categoryId}, 페이지 - ${currentPage}, 페이지 사이즈 - ${pageSize}`);

    location.href = `/subMain?page=${currentPage}&pageSize=${pageSize}&categoriesId=${categoryId}`;
}
