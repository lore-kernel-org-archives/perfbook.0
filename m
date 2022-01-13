Return-Path: <SRS0=LHmb=R5=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=18hRWvZBRG4FrbCm9vk470F8BEf7vZC00ZmeD5QqxLI=;
        b=cOTNl7Gg761fgq9+n32hUIUgD0bQLXEaEKREGAqRrljNKK2FMPJZx2UKgJ/F/g1wYX
         8l0v5hQ9kbP6N4i4iIJNjk38vXzo1tPKHceP5/aouukPjrPIXxj3NKQB2NH+PhbQpf0Q
         FAOcH6z/03ZL5KXT1upWsd6fjKf4nPfz+LjJG7ZM1CCMrf9wNeJvdGHZtPpZL2jrTBVG
         +4q6nyb3nl6WlCZQAQSFkW8pLozamrHYDjxuEya8au9j5Zh5SLkwb/CDyw+PGd+99FKR
         xxjDeeWKnVey5mwp3/vGLM8GumnKc0cCE4ZB2hNQghbdXdCPWcVYtGPzAZ9cNPK2mY24
         Gdyg==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook] RFC: bibliography: make a reference item better
Date: Thu, 13 Jan 2022 11:37:43 +0800
Message-Id: <20220113033743.64472-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, akiyks@gmail.com, luyang.co@gmail.com, perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul and Akira

I can't find "Trinity: A system call fuzzer" in Proceedings of the 13th
Ottawa Linux Symposium, with link below
https://www.kernel.org/doc/mirror/ols2011.pdf

While I can find the author presentation in youtube, with link below
https://www.youtube.com/watch?v=o_2jwfsPh0Y

According to above observations, I try to make the reference item better

Thanks
Zhouyi
---
 bib/swtools.bib | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/bib/swtools.bib b/bib/swtools.bib
index 5bd7e197..31ce0025 100644
--- a/bib/swtools.bib
+++ b/bib/swtools.bib
@@ -517,10 +517,9 @@ Architectural Support for Programming Languages and Operating Systems
 @Conference{DaveJones2011Trinity,
  author = "Dave Jones",
  title = "Trinity: A system call fuzzer",
- booktitle = {Proceedings of the 13\textsuperscript{th} Ottawa Linux Symposium},
+ booktitle = {13\textsuperscript{th} Ottawa Linux Symposium},
  month = {June},
  year = {2011},
- pages = {???--???},
  address = {Ottawa, Canada},
  note={Project repository: \url{https://github.com/kernelslacker/trinity}},
 }
-- 
2.25.1

