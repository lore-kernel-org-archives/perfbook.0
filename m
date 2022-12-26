Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672078621;
	bh=sBLGupxK9UexeK/tQ/RXx7JTGAfb9p4Gu+BBMygZxak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fN77ymqHpyz2UHcq/esGeoGT/m34D09JiNDCMoQsADvHuVPSdzU8sfoUPw8yf07sZ
	 Lg+awhmMgHPOL6no4kJtz7ac7GyafCZfkrZ+5aB5QEWSa6a301n21MYhjBPnBqQROl
	 0jMpEQMFTQ/vnPf/tstMvfChAKHuo1ABBvpkAu14J2kITAssc4A1AHX25XFFHufB+a
	 p8NvW6kj6NoQgCX51eQ1Tl7o+CySFpNim6fzm7fZLgIiMJPOiBJ97lIAbjmagbbCVH
	 1Z4zKvcFzcWJBmYeCla+HoeVkrIRYwBH3uNW2olFfK06ZhIH0s72N30DLqtDmTJN7n
	 qswuFyvA5QAnw==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 0/4] datastruct: Minor fixes
Date: Mon, 26 Dec 2022 10:16:35 -0800
Message-Id: <20221226181639.10795-6-sj@kernel.org>
In-Reply-To: <20221226181639.10795-1-sj@kernel.org>
References: <20221226181639.10795-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Hi Paul,


Hope you're having great holidays.

This patchset contains minor fixes for datastruct/ that found during the
Korean translation[1] of it.

[1] https://github.com/sjp38/perfbook-ko_KR


Thanks,
SJ

SeongJae Park (4):
  datastruct: Remove unnecessary space
  datastruct: Add missed unbreakable spaces
  datastruct: Enclose NULL with \co{}
  datastruct: Put \cref{} content in a single line

 datastruct/datastruct.tex | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

-- 
2.17.1

