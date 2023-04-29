Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682787747;
	bh=usH+K9YG6jnKaBewJVWSgcrA86Msrf3jb92qyJucpXU=;
	h=From:To:Cc:Subject:Date:From;
	b=ZjB7i0YJy8wYDuwXDPUNVLHIo6/phULt308VoGwmsTeFDfqnOSA/+AbWN5mcMg7Rw
	 V18Cav/FRCucd/0J1pPp6uptVWFidzpV6TgcUWevK318uA2wMZhAJ3XcdsttifyZYx
	 Wp/kwyoonriwZhmTtftU7EMOhpyGpDXKK0PcsyHlKN9stoOMGRGtR6wvm2Exsse/Qr
	 wTCFgY8vcVlE5QGNG7mDxghtk6I31s0gajL9T6Pxw0Nzx7P0JLgDvx96eb8PNx4M0o
	 8uWjeyjcupsdikPnc6TB141PGpvGgHWHhWaUI/8LtbcwA799rZf0gSSg7qunZX+6JU
	 j+CHhzIYaIwUw==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 0/2] together: Minor fixups
Date: Sat, 29 Apr 2023 10:02:24 -0700
Message-Id: <20230429170226.3640-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

This patchset contains minor fixups for together/, which found while
doing Korean translation[1].

[1] https://github.com/sjp38/perfbook-ko_KR

SeongJae Park (2):
  together/refcnt: Use \tco{} for code quoting
  together/seqlock: Use term 'sequence lock' consistently

 together/refcnt.tex  | 8 ++++----
 together/seqlock.tex | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.17.1

