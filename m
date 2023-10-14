Return-Path: <SRS0=1PbI=F4=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697272748; x=1697877548; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KoYjWnNphgTDS2D/ggf9DpeH7bh3e7PRS4y/V96QrQM=;
        b=nKkcJBMUMC+oMngpLy1t7ZAdcCKea6nzzchEd4cL1Lmpx7CbaiSfuIOByJze1lPi+y
         9YNiLiiq2kTXHKLF7fUETO+XzuTzSe64OvjlGtTRIcynk6J7jckRezdrnpEK+kLzsf+J
         WwriyS28x2/6srh9Z9ci98zbPYxqe9D/4yp7cQSCu8vf2lu/3pKhRKaJnT+xqA3EkDJ7
         CShVmMojr109TSLRyeFksCuYiyI3iXiBwwpgDzUYCkf9oQRqfYZzZrDb/Gld/KGRFJqx
         kFlOhQOOU/hyZjXf1L82FTn5ptbpwA8XnweQ8RRGHoJYmevjeeWSnvrfN+04O+HuL1Di
         dQfw==
Message-ID: <a2b742c9-3417-4caf-91e1-e58f8a545b6f@gmail.com>
Date: Sat, 14 Oct 2023 17:39:06 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook v2 1/3] bib/memorymodel: Add Tsirkin2017
Content-Language: en-US
References: <20231013012238.1455140-1-joel@joelfernandes.org>
 <91cf01c3-3e67-4763-ab27-9070e50cb245@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <91cf01c3-3e67-4763-ab27-9070e50cb245@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: "Joel Fernandes (Google)" <joel@joelfernandes.org>

Add entry of Linux kernel git commit 450cbdd0125c ("locking/x86:
Use LOCK ADD for smp_mb() instead of MFENCE").

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Co-developed-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Changes in v2 (by akiyks):
  - Split bib update on its own.
  - Add the entry in memorymodel.bib rather than in hw.bib.
    memorymodel.bib is more suitable for references related to
    memory barrier implementation.
  - Escape "_" in the title.
  - Use "{}" for upper case.
  - Use URL of Git commit rather than that of lore.
    Link to lore is available in the changelog.
  - Use date of patch submission rather than that of commit.
---
 bib/memorymodel.bib | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/bib/memorymodel.bib b/bib/memorymodel.bib
index 1ecff7d65f05..4883dfe30901 100644
--- a/bib/memorymodel.bib
+++ b/bib/memorymodel.bib
@@ -373,6 +373,16 @@ International Workshop on Exploiting Concurrency Efficiently and Correctly },
  lastchecked="February 9, 2018",
 }
 
+@unpublished{Tsirkin2017,
+ Author="Michael S. Tsirkin",
+ Title="locking/x86: Use {LOCK ADD} for smp\_mb() instead of {MFENCE}",
+ month="October",
+ day="27",
+ year="2017",
+ note="Git commit:
+\url{https://git.kernel.org/linus/450cbdd0125c}",
+}
+
 @article{Pulte:2017:SAC:3177123.3158107,
  author = {Pulte, Christopher and Flur, Shaked and Deacon, Will and French, Jon and Sarkar, Susmit and Sewell, Peter},
  title = {Simplifying ARM Concurrency: Multicopy-atomic Axiomatic and Operational Models for ARMv8},
-- 
2.25.1


