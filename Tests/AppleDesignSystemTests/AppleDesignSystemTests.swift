import XCTest
@testable import AppleDesignSystem

final class AppleDesignSystemTests: XCTestCase {

    // MARK: - Spacing Tests

    func testSpacingValues() {
        XCTAssertEqual(DSSpacing.xxs, 2)
        XCTAssertEqual(DSSpacing.xs, 4)
        XCTAssertEqual(DSSpacing.sm, 8)
        XCTAssertEqual(DSSpacing.md, 12)
        XCTAssertEqual(DSSpacing.lg, 16)
        XCTAssertEqual(DSSpacing.xl, 20)
        XCTAssertEqual(DSSpacing.xxl, 24)
        XCTAssertEqual(DSSpacing.xxxl, 32)
        XCTAssertEqual(DSSpacing.section, 40)
    }

    func testRadiusValues() {
        XCTAssertEqual(DSRadius.sm, 8)
        XCTAssertEqual(DSRadius.md, 12)
        XCTAssertEqual(DSRadius.lg, 14)
        XCTAssertEqual(DSRadius.xl, 16)
        XCTAssertEqual(DSRadius.xxl, 20)
        XCTAssertEqual(DSRadius.pill, 9999)
    }

    // MARK: - Shadow Tests

    func testShadowStyles() {
        XCTAssertNotNil(DSShadow.sm)
        XCTAssertNotNil(DSShadow.md)
        XCTAssertNotNil(DSShadow.lg)
        XCTAssertNotNil(DSShadow.xl)
    }

    // MARK: - Typography Tests

    func testTypographyStyles() {
        XCTAssertNotNil(DSTypography.caption2)
        XCTAssertNotNil(DSTypography.caption1)
        XCTAssertNotNil(DSTypography.footnote)
        XCTAssertNotNil(DSTypography.subheadline)
        XCTAssertNotNil(DSTypography.callout)
        XCTAssertNotNil(DSTypography.body)
        XCTAssertNotNil(DSTypography.title3)
        XCTAssertNotNil(DSTypography.title2)
        XCTAssertNotNil(DSTypography.title1)
        XCTAssertNotNil(DSTypography.largeTitle)
    }

    // MARK: - Material Tests

    func testMaterialStyles() {
        XCTAssertNotNil(DSMaterial.ultraThin)
        XCTAssertNotNil(DSMaterial.thin)
        XCTAssertNotNil(DSMaterial.regular)
        XCTAssertNotNil(DSMaterial.thick)
        XCTAssertNotNil(DSMaterial.ultraThick)
    }

    // MARK: - Animation Tests

    func testAnimationSprings() {
        // Test that animations can be created
        let defaultSpring = DSAnimation.Spring.default
        let snappySpring = DSAnimation.Spring.snappy
        let bouncySpring = DSAnimation.Spring.bouncy
        let gentleSpring = DSAnimation.Spring.gentle

        XCTAssertNotNil(defaultSpring)
        XCTAssertNotNil(snappySpring)
        XCTAssertNotNil(bouncySpring)
        XCTAssertNotNil(gentleSpring)
    }

    // MARK: - Badge Tests

    func testBadgeInitialization() {
        let badge = DSBadge("Test")
        XCTAssertNotNil(badge)
    }

    func testCountBadgeInitialization() {
        let countBadge = DSCountBadge(count: 5)
        XCTAssertNotNil(countBadge)
    }

    // MARK: - Avatar Tests

    func testAvatarInitialization() {
        let avatar = DSAvatar(name: "John Appleseed")
        XCTAssertNotNil(avatar)
    }

    func testAvatarInitials() {
        let avatar = DSAvatar(name: "John Appleseed", size: .md)
        XCTAssertNotNil(avatar)
    }

    // MARK: - Button Tests

    func testButtonInitialization() {
        let button = DSButton("Test") {}
        XCTAssertNotNil(button)
    }

    func testButtonWithIcon() {
        let button = DSButton("Test", icon: Image(systemName: "star"), style: .filled) {}
        XCTAssertNotNil(button)
    }
}
