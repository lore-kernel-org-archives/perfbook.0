Return-Path: <SRS0=2H1n=D5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691829865; x=1692434665;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojV0QZ6Niclg2iz8CvjC9EWhssJuNMBLN51cw4fIENY=;
        b=iEH+LqNVVZCZNwqXoY3lVD0aTZtVUPB0FLRw4iQAB8/HVcik+DsNdGW7PuA13M890c
         FXMVW3Wn9pkXXju4n82OIfdHjVcFSKzHRJGkOgYV+F5KPBl8X7LFFEtW+tR24cNQV7Wz
         n/Io3ws1h7hx9JJLvPMKlc3575qP3Dl3gRAxd16TaD6Ynpk3zbAxfB972Jd+JKGLqwgC
         RrKSHesBmhMVys42wFApBYWvjMHITgqb3jbox2GxlUGwnecawosh5JSFtBv/GLcIv7Z8
         uDGRcyq+G1GJvlX+inE6HXadmNWvch71HiuxwL7/1KXQvPV6cay5AMStx3bFEv4PTt77
         Ewmw==
Message-ID: <23784f22-18f9-899b-1230-91dfb180854f@gmail.com>
Date: Sat, 12 Aug 2023 17:44:22 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/4] bib/hw: Salvage URL of HewlettPackard05a from
 archive.org
Content-Language: en-US
References: <bfc20978-26e4-8fa1-28a7-894dc8728615@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bfc20978-26e4-8fa1-28a7-894dc8728615@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 70073f786ec2..905e3f7d9ebe 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -285,9 +285,8 @@ System Programming",
  Author="{Hewlett Packard}",
  Title="{HP} {OpenVMS} Systems Documentation",
  year="2005",
- note="Available:
-\url{http://h71000.www7.hp.com/doc/72final/4515/4515pro_contents.html}
-[Viewed: February 27, 2005]",
+ note="Archived at
+\url{https://web.archive.org/web/20040907082451/http://h71000.www7.hp.com/doc/72final/4515/4515pro_contents.html}",
 }
 
 @book{ALPHA95,
-- 
2.25.1


