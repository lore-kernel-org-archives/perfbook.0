Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672078617;
	bh=sBLGupxK9UexeK/tQ/RXx7JTGAfb9p4Gu+BBMygZxak=;
	h=From:To:Cc:Subject:Date:From;
	b=YfqayRg4XQmB08iQs9QiPCDdJrZmUDeGh1PWi+JS1HU57BOucnEWH6j6gfgqoqdDj
	 GmvXp9a7nOw2zHHtAxvW7OFkeK+5T+Jtv09zOZ9cHyeDESVjIUV6yy7PCSfAUWbedv
	 jZp9YlmkQd+MOEjvqVuJ+PxpIst8FPW9+Zk8Nws32WrY7cATAbuON+NoKtrepqy8vC
	 Y0ANaBvhO+1VLF35lswB5s4VZbPIL/xRU4TAjnU5HgVo5i22dyoZVYPw+qWWev9Ipz
	 gRYK1dgJfyEd0feXcX93VMq+QJmEJF6hHwkpFOG+xe1obBxoyQaDzgGDDn+KPbtF2C
	 USGpZ+WQ1ILew==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 0/4] datastruct: Minor fixes
Date: Mon, 26 Dec 2022 10:16:30 -0800
Message-Id: <20221226181639.10795-1-sj@kernel.org>
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

