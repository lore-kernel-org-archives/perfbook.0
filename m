Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680975209;
	bh=jQMHKWemnLY8kboSX+8ryv3RDtsEWk2UyRXbapBDWBI=;
	h=From:To:Cc:Subject:Date:From;
	b=fpuLRfS5qZJ5ao7lr4XCbZJKgQ4eCENcl7zt6YDLdSPEC0yiaRoreQeP+GQduI8Wl
	 mqyJb5zRsfskfMMsR4EjsAazSyrDn0WraUPv2b7VpUmkKdnDU7X72lhsEZwc1JxZ4f
	 gB7VUrNTLjlo5zTH2CrR83nmaTgCfp0lAWT0KJPvAdbvg/jQYN969VEaYe5tU7xBYG
	 AG0WT5fguiaSPYdDFcpoJ2JAQj4wssHminKFVVfr9S/1vVnDKLAiCFxlQO24yk3NcF
	 y4hzweKX90AxXBCop01yHG2hrXea5eHoI1KurgHnADFmmmLeeYBHFN8/okIOBx1Pwl
	 ycO6qeD+iCOpg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 00/12] formal: Trivial fixups
Date: Sat,  8 Apr 2023 10:32:57 -0700
Message-Id: <20230408173309.5543-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

This patchset contains trivial fixups for formal/, which found from
its Korean translation[1].

[1] https://github.com/sjp38/perfbook-ko_KR

SeongJae Park (12):
  formal/formal: Drop cppmem from 'Special-Purpose State-Space Search'
    section explanation
  formal/spinhint: Use \qco{} instead of ``\co{}''
  formal/spinhint: Enclose example code snippets with \co{}
  formal/spinhint: Do not call 2013 paper as recent
  formal/dyntickrcu: Quote 'trail' file consistently
  formal/dyntickrcu: Use \qco{} instead of ``\co{}''
  formal/ppcmem: Use uppercase 'S' for Spin
  formal/ppcmem: Use \qco{} instead of ``\co{}''
  formal/ppcmem: Add missed non-breakable spaces
  formal/ppcmem: Enclose example code snippets with \co{}
  formal/ppcmem: s/powerpc/PowerPC/ on sentences
  formal/ppcmem: Fix label name for Fail1:

 formal/axiomatic.tex  | 30 +++++++++++++++---------------
 formal/dyntickrcu.tex | 10 +++++-----
 formal/formal.tex     |  2 +-
 formal/ppcmem.tex     | 26 +++++++++++++-------------
 formal/spinhint.tex   | 16 ++++++++--------
 5 files changed, 42 insertions(+), 42 deletions(-)

-- 
2.17.1

