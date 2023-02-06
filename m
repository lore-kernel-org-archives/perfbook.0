Return-Path: <SRS0=PHIa=6C=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jNVbNgv1CANOxBvltoecByivbgVZdiqrwl4OjM2IQSw=;
        b=UWoA+iej5PfCq+PNXsPiQfCFvH7Tns5WHdmsSI5P27c0C3EhRLFAdSYzJEnggivzqF
         ZqxEt+BTO8tr6MDQIs7eZRu2SZ2QS7w8AijX63/pXqd1shLjyupPS7XWfULu0wWVbYz1
         bHZbvNj7NTEkiQDqUsifsm6jCa16O9orawa5n/jYgDiHDoS2Ho0Y54QIgmMcH9vshTDn
         fcdVxQ23yN512lYexZsbMDtOnx2LXoCd+uk+53dBnZ6ArJHxvqAB2jxTHcl5dJJ6ObeF
         8Ow0hHsDTi+lUwCpP8LLSdcZPs0HX3EysUk4loL8pvFPZMewaWA8j42grD63buSQvzRb
         ZRPQ==
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH v1] utilities/gitlab-ci: Change base machine type to 2-cpu to fix make check
Date: Mon,  6 Feb 2023 17:55:15 -0300
Message-Id: <20230206205514.442896-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

`make -C CodeSamples/ check` currently fails on Gitlab-CI.

Failure happen on sched_setaffinity:
sched_setaffinity: Invalid argument

Further debuging, it's possible to notice that some tests are trying to set
the cpu affinity in CPUs 0 and 1, so at least 2 cpus are needed for the
test to run properly.

Current (default) saas-linux-small-amd64 instances used for testing on
Gitlab-CI only offer a single CPU, which is not enough.

For the test_codesamples pre-test, change the instance type to
saas-linux-medium-amd64 so the tests can run properly.

Fixes: 9217963c ("utilities/gitlab-ci.yml: Add 'make check' on
test_codesamples")
Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 utilities/gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
index 9545029e..42eda60f 100644
--- a/utilities/gitlab-ci.yml
+++ b/utilities/gitlab-ci.yml
@@ -5,6 +5,7 @@ stages:
   - build
 
 test_codesamples:
+    tags: [ saas-linux-medium-amd64 ]
     stage: test
 
     before_script:
-- 
2.39.1

