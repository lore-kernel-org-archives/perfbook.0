Return-Path: <SRS0=8s4x=OA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WW5gXBDtdwqRSNAr1NF/77Js9syRzsGSo0g6JIlzU0o=;
        b=QVVlkubI6GCbN6DzjKF6lax42r3HE9uIPP23iRFs8EZziiygGs0cV6lsXMvF9H1Ahc
         spHxfVc/X1eO8xgEfEIx5LzLXR6UVGyoJoM7EU1+bDUa4Ip3gwEZ5VF1JA3/qUFLldRA
         XMo5O/1+CB0XImLcPh3hfm31EboVid1lTcfmYDLXF6+DxUSLtHRAD6pf7RxSmKvvJ00a
         94HJSKFEAU8GAFZ6WVOkEy9jiYCnVaHrGcS/tprk3+Aq/o0pJfH4QLSXBn/KVLS1RDoG
         6zGUvNGCEHrHZiV+zZLZ8TKtBWKq+oD0mwSJdtimIf0EYSkbFI8OWO5330KwiRChn7oG
         mkng==
Subject: [INCOMPLETE PATCH --perfbook v2 3/3] datastruct: Remove stray .eps
 files
References: <19d34b29-3ccf-39c9-c933-c53fcf552a47@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f756cff4-7fde-3d25-a95c-bad5917fbd2a@gmail.com>
Date: Fri, 10 Sep 2021 19:13:48 +0900
MIME-Version: 1.0
In-Reply-To: <19d34b29-3ccf-39c9-c933-c53fcf552a47@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/perftest.eps          | 2252 -------------------------
 datastruct/perftestlin.eps       | 2102 -----------------------
 datastruct/perftestresize.eps    | 2637 -----------------------------
 datastruct/perftestresizebig.eps | 2699 ------------------------------
 datastruct/zoocatall.eps         | 2210 ------------------------
 datastruct/zoocatalllin.eps      | 2102 -----------------------
 datastruct/zoocatonly.eps        | 2206 ------------------------
 datastruct/zoocatonlylin.eps     | 2102 -----------------------
 datastruct/zoocpu.eps            | 2327 --------------------------
 datastruct/zoocpubktlin.eps      | 2106 -----------------------
 datastruct/zoocpubktlin8.eps     | 2196 ------------------------
 datastruct/zoocpubktsizelin.eps  | 2153 ------------------------
 datastruct/zoocpulin.eps         | 2249 -------------------------
 datastruct/zooupdate.eps         | 2268 -------------------------
 datastruct/zooupdatelu.eps       | 2210 ------------------------
 datastruct/zooupdatelulin.eps    | 2174 ------------------------
 16 files changed, 35993 deletions(-)
 delete mode 100644 datastruct/perftest.eps
 delete mode 100644 datastruct/perftestlin.eps
 delete mode 100644 datastruct/perftestresize.eps
 delete mode 100644 datastruct/perftestresizebig.eps
 delete mode 100644 datastruct/zoocatall.eps
 delete mode 100644 datastruct/zoocatalllin.eps
 delete mode 100644 datastruct/zoocatonly.eps
 delete mode 100644 datastruct/zoocatonlylin.eps
 delete mode 100644 datastruct/zoocpu.eps
 delete mode 100644 datastruct/zoocpubktlin.eps
 delete mode 100644 datastruct/zoocpubktlin8.eps
 delete mode 100644 datastruct/zoocpubktsizelin.eps
 delete mode 100644 datastruct/zoocpulin.eps
 delete mode 100644 datastruct/zooupdate.eps
 delete mode 100644 datastruct/zooupdatelu.eps
 delete mode 100644 datastruct/zooupdatelulin.eps

diff --git a/datastruct/perftest.eps b/datastruct/perftest.eps
deleted file mode 100644
index 6ba4b2c7..00000000
diff --git a/datastruct/perftestlin.eps b/datastruct/perftestlin.eps
deleted file mode 100644
index 615bbcbd..00000000
diff --git a/datastruct/perftestresize.eps b/datastruct/perftestresize.eps
deleted file mode 100644
index be3e621f..00000000
diff --git a/datastruct/perftestresizebig.eps b/datastruct/perftestresizebig.eps
deleted file mode 100644
index 1a2f31a1..00000000
diff --git a/datastruct/zoocatall.eps b/datastruct/zoocatall.eps
deleted file mode 100644
index eb22b82f..00000000
diff --git a/datastruct/zoocatalllin.eps b/datastruct/zoocatalllin.eps
deleted file mode 100644
index 1074b86e..00000000
diff --git a/datastruct/zoocatonly.eps b/datastruct/zoocatonly.eps
deleted file mode 100644
index 170d562a..00000000
diff --git a/datastruct/zoocatonlylin.eps b/datastruct/zoocatonlylin.eps
deleted file mode 100644
index b669ff75..00000000
diff --git a/datastruct/zoocpu.eps b/datastruct/zoocpu.eps
deleted file mode 100644
index 51e8f908..00000000
diff --git a/datastruct/zoocpubktlin.eps b/datastruct/zoocpubktlin.eps
deleted file mode 100644
index 101cf178..00000000
diff --git a/datastruct/zoocpubktlin8.eps b/datastruct/zoocpubktlin8.eps
deleted file mode 100644
index 434e007e..00000000
diff --git a/datastruct/zoocpubktsizelin.eps b/datastruct/zoocpubktsizelin.eps
deleted file mode 100644
index 95a5c8df..00000000
diff --git a/datastruct/zoocpulin.eps b/datastruct/zoocpulin.eps
deleted file mode 100644
index 90e8be8d..00000000
diff --git a/datastruct/zooupdate.eps b/datastruct/zooupdate.eps
deleted file mode 100644
index 01bdb903..00000000
diff --git a/datastruct/zooupdatelu.eps b/datastruct/zooupdatelu.eps
deleted file mode 100644
index 3d5efac6..00000000
diff --git a/datastruct/zooupdatelulin.eps b/datastruct/zooupdatelulin.eps
deleted file mode 100644
index 1a778b6b..00000000
-- 
2.17.1


