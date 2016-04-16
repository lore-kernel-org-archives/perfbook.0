Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=aaM8HX98PrRQphGq5C0Az1FvATGobx/623Q5AquK0x4=;
 b=OnWQvwbMFvLCcwtsmqav+RlLRffYMoeZH632cUJfsZfjkREaqh57lN0Iv5Yt/+GXqw
 An5ydvhRwgpXV1rsp14dGAgPpsgSpEa9XmJEgiZ47CxM22dRKy4vCX9eMzcq/O6j/9hL
 oNm0Mh9vlzmdwFQdfYR6hSAvWVShaHqOWs9o1XOiez4XETw6Rf7m9gktq9aMscnbGlh2
 vFllYVz7oQ57wRPwGveUdH9SXhBJaH0NFFf9dZ+uYZDyZFcGeWWDnI4+r0vQznMDxx9Q
 dK4K1ejOfiZNKFGfuqk9JGhjRbAErMBR2wSdykYrCSig7W3ouzFiu9aYotEBx83aT5yN
 54hA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] advsync: Typo fix and vertical spacing tweaks
Message-ID: <5711F2CF.1030907@gmail.com>
Date: Sat, 16 Apr 2016 17:07:43 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From e9f9f2126a24841bb19970292716819f0300872b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Sat, 16 Apr 2016 16:48:19 +0900
Subject: [PATCH 0/3] advsync: Typo fix and vertical spacing tweaks

As I mentioned earlier, I tweaked vertical spacings in the
`Guarantees` subsection. This series also fixes a typo I made
in the previous patch. It also adds necessary blank lines in the
latex source of the `What Can You Trust?` subsection.

Akira Yokosawa (3):
  advsync: Fix a trivial typo
  advsync: Add necessary blank lines around minipages
  advsync: Tweak vertical spacing around code snippets

 advsync/memorybarriers.tex | 44 ++++++++++++++------------------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

-- 
1.9.1


