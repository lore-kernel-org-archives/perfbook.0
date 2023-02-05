Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675621311;
	bh=s90ZlkDyHwQNBuBpQeslcqFRU3bvy8/ENmFpytxDcXc=;
	h=From:To:Cc:Subject:Date:From;
	b=uyeL8+6RfiO/p7CYB8nvoxEQzC6Q3Rl6tmXDXWZWEwK96a0KCdLqHor6kux3djeAs
	 C+5Mt69vbo15wEkhc33Txv4SEzT2IQs7rVcWNYJaojv6btTxhlc/2t/vjU1Zaz8UT4
	 aamRntAx9UdB29RNUy0ZbTtvP6WqPfLbnx6A2ry7nguANEToA0RHrDD7Ow9Kvppvnb
	 wnh4+TrIqiWO9lGmTc+a784zaP+2HejjyQo3XV3X0LP109cK+LF93LrROArjbWKhEf
	 xlxM5cqumbtPxmKhTyrhEvgnsrAoc0us4SXf5u5o90cTHP3dN18V9Km4c9dfiG+Qwi
	 f4JYTvGh9Hm+w==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 0/5] debugging: Trivial fixups
Date: Sun,  5 Feb 2023 10:21:23 -0800
Message-Id: <20230205182128.19044-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

This patchset contains trivial fixups for debugging/, which found while
doing Korean translation[1].

[1] https://github.com/sjp38/perfbook-ko_KR

SeongJae Park (5):
  debugging: Use \co{} for 'time' output examples
  debugging: Use \co{} for 'git' and 'Fixes:'
  debugging: Use \co{} for rcutorture
  debugging: Remove unnecessary space in a sentence
  debugging/debugging: s/remainder of a section/following sections/

 debugging/debugging.tex | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

-- 
2.17.1

