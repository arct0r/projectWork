// notify dossier dom is loaded
window.parent.postMessage({ type: "docIframe.domReady" }, "*");
const tabNavState = {
  dasTabContainer: undefined,
  dasTabWrapper: undefined,
  dasTabs: undefined,
  dasHeaderHeight: 0,
  dasTabWrapperHeight: 0,
  leftHidden: null,
  rightHidden: null,
};
scrollInFlight = false;
window.addEventListener("DOMContentLoaded", function () {
  init();
});

function init() {
  // intercept link clicks
  const body = document.querySelector("body");
  body.addEventListener("click", function (e) {
    const { target } = e;

    const link =
      target instanceof HTMLAnchorElement ? target : target.closest("a");
    if (link instanceof HTMLAnchorElement && link?.rel === "host") {
      e.preventDefault();
      visitDocument(link);
    }
  });
  document.addEventListener("scrollend", function (e) {
    const top =
      (window.pageYOffset || document.documentElement.scrollTop) -
      (document.documentElement.clientTop || 0);
    if (top > 100) {
      document.body.classList.add("das-scrolled");
    } else {
      document.body.classList.remove("das-scrolled");
    }
  });
  document.getElementById("das-totop").addEventListener("click", scrollTop);
  //das-document-body
  const tabContent = getTopLevelSections();
  tabNavState.dasTabContainer = document.getElementById("section-link-list");
  tabNavState.dasTabWrapper = document.querySelector(
    ".document-header__section-links-items"
  );
  tabContent.map((tab) => {
    const li = document.createElement("li");
    li.innerText = tab.label;
    li.addEventListener("click", scrollToEl(tab.el, li));
    tabNavState.dasTabContainer.appendChild(li);
  });
  tabNavState.dasTabs = document.querySelectorAll(".section-link-list>li");
  setupTabArrows(tabNavState.dasTabWrapper, tabNavState.dasTabs);

  setStickyTabHeader();

  window.addEventListener("resize", () => {
    setupTabArrows(tabNavState.dasTabWrapper, tabNavState.dasTabs);
  });

  runIntercectionObserver();
  document.getElementById("das-empty-elements-toggle").checked = true;
  toggleEmptyFields();
  fixAttachmentLinks();
}

function visitDocument(link) {
  const documentKey = link.getAttribute("href").replaceAll("/", "_").trim();
  const url = link.href.trim();

  window.parent.postMessage({
    type: "docIframe.visitDocument",
    detail: { documentKey, url },
  });
}

function goToAttachment(filename) {
  window.location.href = filename;
}

function fixAttachmentLinks() {
  const links = document.querySelectorAll(
    ".das-attachment_value > a, .das-field_value_image > figure > a"
  );
  if (links.length > 0) {
    links.forEach((link) => {
      const uuid = link.getAttribute("data-attachment-uuid");
      const filename = link.getAttribute("data-filename");
      if (uuid && filename) {
        const href = window.location.href.replace(
          /\/documents.*$/,
          `/attachments/${uuid}/${filename}`
        );
        link.href = href;
        if (filename.toLowerCase().trim().endsWith(".pdf")) {
          link.classList.add("das-link-pdf", "das-link-external");
        }
        const img = link.querySelector("img");
        if (img) {
          img.src = href;
        }
      }
    });
  }
}

function toggleEmptyFields() {
  const emptyFields = document.querySelectorAll(".das-field_no-value");
  emptyFields.forEach((f) => f.classList.toggle("das-hidden"));
  setTimeout(() => {
    window.parent.postMessage({ type: "docIframe.recalculateDocHeight" }, "*");
  }, 100)
}

function setActiveLeaf(el) {
  const leafs = document.querySelectorAll(".das-leaf");
  leafs.forEach((leaf) => leaf.classList.remove("leaf-active"));
  el.classList.add("leaf-active");
}

function setActiveTab(el) {
  dasTabs.forEach((tab) => tab.classList.remove("active"));
  el.classList.add("active");
}

function scrollToEl(el, navLi) {
  return (e) => {
    scrollInFlight = true;
    tabNavState.dasTabs.forEach((tab) => tab.classList.remove("active"));
    navLi.classList.add("active");
    const offset = -50;
    const y = el.getBoundingClientRect().top + window.pageYOffset + offset;
    window.scrollTo({ top: y, behavior: "smooth" });
    setTimeout(() => (scrollInFlight = false), 800);
  };
}

function setupTabArrows(container, tabs) {
  const ulWrap = document.getElementById("section-link-list");
  if (getComputedStyle(ulWrap).display !== "flex") return;
  let hasLeftHidden = false,
    hasRightHidden = false;
  tabNavState.rightHidden = null;
  tabNavState.leftHidden = null;
  // need the index to determine if non visible elements are to left or right
  // of visible elements
  let visibleIndex = null;
  const maxTabWidth = tabNavState.dasTabWrapper.offsetWidth - 20;
  // iterate tabs and set max width before setting up
  // tab state
  tabs.forEach((tab) => {
    if (tab.offsetWidth > maxTabWidth) {
      // in flex layout, this is like setting max width
      tab.style.minWidth = `${maxTabWidth}px`;
      tab.style.textOverflow = "ellipsis";
      tab.style.overflow = "hidden";
    }
  });

  tabs.forEach((tab, tabIndex) => {
    if (!isElementVisible(container, tab)) {
      // is it left or right from visible elements?
      if (visibleIndex !== null) {
        // the element is to the right
        hasRightHidden = true;
        if (tabNavState.rightHidden === null) {
          tabNavState.rightHidden = tab;
        }
      } else {
        // the element is to the left
        tabNavState.leftHidden = tab;
        hasLeftHidden = true;
      }
    } else {
      // update current visible index
      visibleIndex = tabIndex;
    }
  });
  const rightArrow = document.querySelector(".section-link-action-right");
  const leftArrow = document.querySelector(".section-link-action-left");
  if (!hasLeftHidden) {
    leftArrow.classList.add("disabled");
  } else {
    leftArrow.classList.remove("disabled");
  }
  if (!hasRightHidden) {
    rightArrow.classList.add("disabled");
  } else {
    rightArrow.classList.remove("disabled");
  }
}

function isElementVisible(container, element, partial = false) {
  if (!container || !element) {
    return false;
  }
  const containerBounds = container.getBoundingClientRect();
  const elementBounds = element.getBoundingClientRect();
  const containerBoundsLeft = Math.floor(containerBounds.left);
  const containerBoundsRight = Math.floor(containerBounds.right);
  const elementBoundsLeft = Math.floor(elementBounds.left);
  const elementBoundsRight = Math.floor(elementBounds.right);

  // Check if in view
  const isTotallyInView =
    elementBoundsLeft >= containerBoundsLeft &&
    elementBoundsRight <= containerBoundsRight;
  const isPartiallyInView =
    partial &&
    ((elementBoundsLeft < containerBoundsLeft &&
      elementBoundsRight > containerBoundsLeft) ||
      (elementBoundsRight > containerBoundsRight &&
        elementBoundsLeft < containerBoundsRight));

  // Return outcome
  return isTotallyInView || isPartiallyInView;
}

function getScrollAmount(container, element) {
  if (!container || !element) {
    return false;
  }
  const containerBounds = container.getBoundingClientRect();
  const elementBounds = element.getBoundingClientRect();
  const containerBoundsLeft = Math.floor(containerBounds.left);
  const containerBoundsRight = Math.floor(containerBounds.right);
  const elementBoundsLeft = Math.floor(elementBounds.left);
  const elementBoundsRight = Math.floor(elementBounds.right);

  // totally in view
  if (
    elementBoundsLeft >= containerBoundsLeft &&
    elementBoundsRight <= containerBoundsRight
  )
    return 0;
  // left part not visible
  if (elementBoundsLeft < containerBoundsLeft) {
    return containerBoundsLeft - elementBoundsLeft;
  }
  // right part not visible
  if (elementBoundsRight > containerBoundsRight) {
    return elementBoundsRight - containerBoundsRight;
  }
  return 0;
}

function scrollTabs(direction, el) {
  if (el.classList.contains("disabled")) return;
  const ulWrap = document.getElementById("section-link-list");
  if (getComputedStyle(ulWrap).display !== "flex") {
    ulWrap.style.marginLeft = 0;
    return;
  }
  let currentMargin = +tabNavState.dasTabContainer.style.marginLeft.replaceAll(
    "px",
    ""
  );
  const scrollAmount =
    direction === "right"
      ? -getScrollAmount(tabNavState.dasTabWrapper, tabNavState.rightHidden)
      : direction === "left"
      ? getScrollAmount(tabNavState.dasTabWrapper, tabNavState.leftHidden)
      : 0;

  currentMargin = currentMargin + scrollAmount;
  tabNavState.dasTabContainer.style.marginLeft = `${currentMargin}px`;
  // timeout required because we have transition animation set to 200ms
  setTimeout(
    () => setupTabArrows(tabNavState.dasTabWrapper, tabNavState.dasTabs),
    500
  );
}

function getTopLevelSections() {
  const topSections = document.querySelectorAll(".das-document > .das-block");
  const result = [];
  topSections.forEach((section) => {
    let label = null;
    const children = section?.children;
    if (children) {
      for (let i = 0; i < children.length; i++) {
        if (children[i].classList.contains("das-block_label")) {
          label = children[i].outerText;
        } else {
          label = null;
        }
        if (label) result.push({ label, el: section });
      }
    }
  });
  return result;
}

// sticky header set dynamic, needs to take into consideration header height and tabs nav height
function setStickyTabHeader() {
  const header = document.querySelector(".document-header__section-links");
  tabNavState.dasHeaderHeight = header.offsetHeight;
  const tabLinks = document.querySelector(".document-header__section-links");
  tabNavState.dasTabWrapperHeight = tabLinks.offsetHeight;
  header.style.position = "sticky";
  header.style.top = `-${
    -10 + tabNavState.dasHeaderHeight - tabNavState.dasTabWrapperHeight
  }px`;
}

/**
 * -Sets up intersection observer on each top level section
 * -Updates tabs with a data attr with intersection percentage
 *  of the relevant section
 * -Sets active tab depending on highest intersection percentage
 */
function runIntercectionObserver() {
  const options = {
    rootMargin: `-50px`,
    threshold: [
      0, 0.01, 0.05, 0.1, 0.15, 0.2, 0.3, 0.5, 0.6, 0.7, 0.8, 0.91, 0.93, 0.95,
      0.97, 0.99, 1,
    ],
  };

  const onIntersect = (entries) => {
    if (scrollInFlight) return;
    entries.forEach((entry) => {
      const lbl = entry.target.firstElementChild.innerHTML.trim();
      let nav = null;
      tabNavState.dasTabs.forEach((cn) => {
        if (cn.innerHTML === lbl) nav = cn;
      });
      if (nav) {
        nav.dataset["intersect"] = entry.intersectionRatio.toFixed(2);
      }
    });
    // highest data-intersect attr gets active class
    let topIntersection = 0;
    let activeNav = null;
    tabNavState.dasTabs.forEach((nav) => {
      nav.classList.remove("active");
      const intersecting = nav.dataset["intersect"];
      if (intersecting && parseFloat(intersecting) > topIntersection) {
        topIntersection = parseFloat(intersecting);
        activeNav = nav;
      }
    });
    if (activeNav) activeNav.classList.add("active");
  };

  const observer = new IntersectionObserver(onIntersect, options);
  const topSections = document.querySelectorAll(".das-document > .das-block");
  topSections.forEach((section) => {
    observer.observe(section);
  });
}

function scrollTop(e) {
  e.preventDefault();
  window.scrollTo({ top: 0, behavior: "smooth" });
}
