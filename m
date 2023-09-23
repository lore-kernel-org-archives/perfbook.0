Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486742;
	bh=N0vdYsGojizUUMzquo8GpjBu0yqE2yglnZc3uFkDMes=;
	h=From:To:Cc:Subject:Date:From;
	b=lB3yovPipBjbRr7DQMl7KQS2bey6uBfYaey7wd2i1lIfh4r7gflw9JmrTPxq5O5Nn
	 ZpCfYDODVt+HoRCupWnpDJAwiUzVpWKKqTburDcFzFUbVCux9nm5n+cmEQ+ESrzkvD
	 gpQsRRlart53ayi3hdXok5Ap8N9ZJxmNTDIS8EI7b5oPCe16tJ+6kuYXsFx4cWtmJX
	 uiDTgYFOV83oMYZ+QEBDpLcUkZjzve6n1HKMVIQbock8jsTnieESbpNlIdrErCKVrN
	 23W++sLZvfn5rFtK3OPpqyW5Zvx/n7klRVkpy9/ht2luWBCzwzimIiNmE9OL3+FOn+
	 SzG7SvnUUo5Jg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 00/10] memorder: Trivial fixups
Date: Sat, 23 Sep 2023 09:31:54 -0700
Message-Id: <20230923163204.14558-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

This patchset contains trivial fixups memorderdebugging/, which found
while doing Korean translation[1].

[1] https://github.com/sjp38/perfbook-ko_KR

SeongJae Park (10):
  memorder: Fix typos: s/,/./
  memorder/memorder: Add a missing space between column name and
    'column'
  memorder: Add missing unbreakable spaces between 'values', 'and', and
    numbers
  memorder: Remove an empty fcvref block
  memorder: Remove braces for single line if-else blocks
  memorder: Consistently use \co{} instead of {\tt } for code
  memorder: Consistently use '\co{}' for 'herd'
  memorder: Remove a redundant sentence for memory barrier strength
  memorder: Make clear the scope of READ_ONCE()/WRITE_ONCE() heavy uses
  memorder: Fix wrong primitive names in a quick quizz

 memorder/memorder.tex | 72 ++++++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 39 deletions(-)

-- 
2.17.1

