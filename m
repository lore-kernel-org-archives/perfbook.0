Return-Path: <SRS0=2H1n=D5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691829788; x=1692434588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqvEwYKeFV9lkc6sUoJ0mYCOb2qcwDQP3fF9YTHF/b0=;
        b=qCxFSAGRygjq2kFytQQ0t6MSPtHJknkKQ+cL3uMmWV88HPdJoU9uj66tUcOXw9Hw+9
         +8h0PwXUACUzv0BAQJtuZZ9KY6NnACLjekp0/Fy6VoD/wLtAcdr4fCR5jQxbgsAadmrj
         Qjgc+V9ddD4/T6AtzQUZ1VGOjg5t2dC2KPZqijNvD7vFRZc9ataWIJo9hEdJ7VsQ8Eno
         4UEuusYFR1IwtNORwNkX6lA1yWuDu++8WW0efn3FKOJ6tLvUYTPVVwmY6sdJ0Bp9TnUA
         6Qo/+4LF1d5tXkFfYE4WkNqcFt/de++UdXtnj3zIl0EW+3XID7XcM3WW7rm64q3X2ayM
         FPSA==
Message-ID: <2c24e1f2-8950-b215-68b0-3168a54259c5@gmail.com>
Date: Sat, 12 Aug 2023 17:43:04 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/4] bib/hw: Salvage URL of MIPSvII-A-2016
Content-Language: en-US
References: <bfc20978-26e4-8fa1-28a7-894dc8728615@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bfc20978-26e4-8fa1-28a7-894dc8728615@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The landing page at the old URL has disappeared.
Use the direct link to AWS instead.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 6b35552ba94f..70073f786ec2 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -555,7 +555,8 @@ Set Reference Manual",
  organization="{Wave Computing, Inc.}",
  year="2016",
  number="MD00087 Rev. 6.06",
- note={URL: \url{https://www.mips.com/downloads/the-mips64-instruction-set-v6-06/}},
+ note={URL: \url{https://s3-eu-west-1.amazonaws.com/downloads-mips/documents/MD00087-2B-MIPS64BIS-AFP-6.06.pdf}},
+ lastchecked="August 10, 2023",
 }
 
 @manual{MIPSvII-A-2017,
-- 
2.25.1


