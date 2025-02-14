var map, geocoder, marker, infowindow;

function openModal(placesList) {
	document.getElementById("mapModal").style.display = "flex";

	var placesList = JSON.parse(placesList);
	
	setTimeout(function() {
		var container = document.getElementById('modalMap');
		var options = {
			center: new kakao.maps.LatLng(35.790329, 129.332092),
			level: 3
		};

		// 지도 초기화 (이미 있으면 다시 생성하지 않음)
		if (!map) {
			map = new kakao.maps.Map(container, options);
			geocoder = new kakao.maps.services.Geocoder();
			marker = new kakao.maps.Marker();
			infowindow = new kakao.maps.InfoWindow({ zindex: 1 });
		

//			매개변수 받아서 동적으로 입력 
			var positions = placesList.map( (item) => {
				return {
					title : item.title,
					latlng : new kakao.maps.LatLng(item.latitude, item.longitude)
				};
			});
			

			// 마커 이미지의 이미지 주소
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

			// 여러 개의 마커 생성
			for (var i = 0; i < positions.length; i++) {
				// 마커 이미지 크기
				var imageSize = new kakao.maps.Size(24, 35);

				// 마커 이미지를 생성
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

				// 마커를 생성
				var marker = new kakao.maps.Marker({
					map: map, // 마커를 표시할 지도
					position: positions[i].latlng, // 마커를 표시할 위치
					title: positions[i].title, // 마커의 타이틀
					image: markerImage // 마커 이미지 
				});

				// 마커 클릭 이벤트 - 인포윈도우 표시
				(function(marker, i) {
					kakao.maps.event.addListener(marker, 'click', function() {
						var content = `<div class="bAddr">
			                                       <span class="title">${positions[i].title}</span>
			                                   </div>`;
//											   ${titles[i]}
						// 인포윈도우 표시
						infowindow.setContent(content);
						infowindow.open(map, marker);
					});
				})(marker, i);
			}






			// 지도 클릭 이벤트 - 마커 위치에 대한 주소 검색
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
				searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
					if (status === kakao.maps.services.Status.OK) {
						var detailAddr = result[0].road_address
							? `<div>도로명주소 : ${result[0].road_address.address_name}</div>`
							: "";
						detailAddr += `<div>지번 주소 : ${result[0].address.address_name}</div>`;

						var content = `<div class="bAddr">
                                        <span class="title">해당 주소정보</span> 
                                        ${detailAddr}
                                    </div>`;

						// 마커 표시
						marker.setPosition(mouseEvent.latLng);
						marker.setMap(map);

						// 인포윈도우 표시
						infowindow.setContent(content);
						infowindow.open(map, marker);
					}
				});
			});
		} else {
			// 기존 지도 다시 중심으로 이동
//			map.relayout();
			map.setCenter(new kakao.maps.LatLng(35.790329, 129.332092));
		}
	}, 100);
}

function closeModal() {
	document.getElementById("mapModal").style.display = "none";
}

function searchDetailAddrFromCoords(coords, callback) {
	geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}
