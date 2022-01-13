Return-Path: <SRS0=LHmb=R5=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HxjkwTuphP3t7AL8qdONWNK2+MRNhRGlqDLVGqkGiV4=;
        b=e3qetDwd/BeMx40bw1nujoZfip4lrIVtPBMucmW/puL0W+Qns66zIpMsAoXq7PqmMQ
         6KDNzMXmFq17zr+EQOu1D+R6bFrI1GXf6FUSPaylcb7LOc0eCGDZlvDAmpG2o8xz/I01
         2ryrdYVN3ua2iuJVC2xslGG5xHYgzq2sVon5kQ87ZfJl7Nv0w0h0DXpnH7lFznl32MfD
         s09v3h5SE8ikmdsCW4UE4yaIK6rOYNten1EC2t/PlQ9KyCZBiX9SlwgcZSBLy/acttIh
         2Yvo4ubLB5mfG90zqX6BAWBoiL+yqju1Q9aczRvuUugqDbez/l1CEPtAUPyUTFIeTVe7
         W0ag==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook v2] RFC: bibliography: make a reference item better
Date: Thu, 13 Jan 2022 11:43:36 +0800
Message-Id: <20220113034336.64794-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, akiyks@gmail.com, luyang.co@gmail.com, perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

I can't find "Trinity: A system call fuzzer" in Proceedings of the 13th
Ottawa Linux Symposium, with link below
https://www.kernel.org/doc/mirror/ols2011.pdf

While I do find the author's presentation in youtube, with link below
https://www.youtube.com/watch?v=o_2jwfsPh0Y

According to above observations, I try to make the reference item better

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Hi Paul and Akira

I can't find "Trinity: A system call fuzzer" in Proceedings of the 13th
Ottawa Linux Symposium, with link below
https://www.kernel.org/doc/mirror/ols2011.pdf

While I can find the author's presentation in youtube, with link below
https://www.youtube.com/watch?v=o_2jwfsPh0Y

According to above observations, I try to make the reference item better

Thanks
Zhouyi
--
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

